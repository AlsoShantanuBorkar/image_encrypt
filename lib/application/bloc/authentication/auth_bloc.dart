import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_event.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

enum AuthMethod {
  pin,
  face,
  fingerprint,
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final LocalAuthentication localAuthentication = LocalAuthentication();
  AuthBloc() : super(AuthBlocState()) {
    on<AuthBlocEvent>((event, emit) async {
      await event.when<FutureOr<void>>(
        init: () async {
          emit(state.copyWith(isLoading: true));
          bool isPin = await secureStorage.containsKey(key: "user_pin");
          emit(state.copyWith(isLoading: false, isExistingUser: isPin));
          FlutterLogs.logInfo(
              "AuthBloc Log", "Action: Init", "Is Existing User : $isPin");
        },
        selectAuthMethod: (AuthMethod authMethod) {
          if (authMethod == AuthMethod.face ||
              authMethod == AuthMethod.fingerprint) {}
          emit(state.copyWith(authMethod: authMethod));
          FlutterLogs.logInfo("AuthBloc Log", "Action: Select Auth Method", "");
        },
        enterPin: (String enteredPin, BuildContext context) async {
          emit(state.copyWith(isLoading: true));
          try {
            if (state.isExistingUser) {
              Uint8List pinToBytes = utf8.encode(enteredPin);
              String enteredPinHash = sha256.convert(pinToBytes).toString();
              await secureStorage.read(key: "user_pin").then((String? pinHash) {
                if (pinHash! == enteredPinHash) {
                  emit(state.copyWith(
                      isAuthenticated: true,
                      isLoading: false,
                      enteredPin: null));
                  FlutterLogs.logInfo("AuthBloc Log", "Action: Enter Pin",
                      "Old User Authenticated");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Incorrect Pin")));
                  FlutterLogs.logInfo(
                      "AuthBloc Log", "Action: Enter Pin", "Incorrect Pin");
                }
              });

              return;
            } else {
              Uint8List pinToBytes = utf8.encode(enteredPin);
              String enteredPinHash = sha256.convert(pinToBytes).toString();
              await secureStorage.write(key: "user_pin", value: enteredPinHash);
              emit(state.copyWith(
                  isAuthenticated: true, enteredPin: null, isLoading: false));
              FlutterLogs.logInfo("AuthBloc Log", "Action: Enter Pin",
                  "New User Authenticated");
            }
          } catch (e) {
            FlutterLogs.logInfo(
                "AuthBloc Log", "Enter Pin Error", e.toString());
          }
        },
        resetPin: (String newPin, BuildContext context) async {
          emit(state.copyWith(isLoading: true));
          try {
            Uint8List pinToBytes = utf8.encode(newPin);
            String enteredPinHash = sha256.convert(pinToBytes).toString();

            await secureStorage
                .write(key: "user_pin", value: enteredPinHash)
                .then((value) {
              emit(
                state.copyWith(
                    isAuthenticated: true, enteredPin: null, isLoading: false),
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Pin Changed")));
              FlutterLogs.logInfo(
                  "AuthBloc Log", "Action: Reset Pin", "Pin Changed");
              Navigator.pop(context);
            });
          } catch (e) {
            FlutterLogs.logInfo(
                "AuthBloc Log", "Reset Pin Error", e.toString());
          }
        },
      );
    });
  }
}
