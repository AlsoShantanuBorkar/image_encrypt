import 'package:image_encrypt/application/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthBlocEvent with _$AuthBlocEvent {
  factory AuthBlocEvent.init() = _Init;
  factory AuthBlocEvent.selectAuthMethod({required AuthMethod authMethod}) =
      _SelectAuthMethod;
  factory AuthBlocEvent.enterPin(
      {required String pin, required BuildContext context}) = _EnterPin;
  factory AuthBlocEvent.resetPin(
      {required String newPin, required BuildContext context}) = _ResetPin;
}
