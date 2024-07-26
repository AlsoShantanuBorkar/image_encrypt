import 'package:image_encrypt/application/bloc/authentication/auth_bloc.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_event.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  State<PinInputScreen> createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final TextEditingController enterPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  final FocusNode enterPinFocusNode = FocusNode();
  final FocusNode confirmPinFocusNode = FocusNode();

  late final GlobalKey<FormState> singleFormKey;
  late final GlobalKey<FormState> doubleFormKey;

  @override
  void initState() {
    singleFormKey = GlobalKey<FormState>();
    doubleFormKey = GlobalKey<FormState>();
    Permission.manageExternalStorage.request();

    context.read<AuthBloc>().add(AuthBlocEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) {
        if (state.isExistingUser) {
          return Scaffold(
            appBar:
                AppBar(title: const Text("Authentication"), centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: singleFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Enter Your Pin"),
                    const SizedBox(
                      height: 10,
                    ),
                    Pinput(
                      focusNode: enterPinFocusNode,
                      controller: enterPinController,
                      length: 6,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null) {
                          return "Enter a pin";
                        } else if (value.isEmpty) {
                          return "Pin cannot be empty";
                        } else if (value.length < 6) {
                          return "Pin should be 6 Digits long";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (singleFormKey.currentState!.validate()) {
                          enterPinFocusNode.unfocus();
                          context.read<AuthBloc>().add(AuthBlocEvent.enterPin(
                              pin: enterPinController.text, context: context));
                        }
                      },
                      child: const Text("Confirm"),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Authentication"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: doubleFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Enter Your Pin"),
                  const SizedBox(
                    height: 10,
                  ),
                  Pinput(
                    focusNode: enterPinFocusNode,
                    controller: enterPinController,
                    length: 6,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null) {
                        return "Enter a pin";
                      } else if (value.isEmpty) {
                        return "Pin cannot be empty";
                      } else if (value.length < 6) {
                        return "Pin should be 6 Digits long";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Confirm Pin"),
                  Pinput(
                    validator: (value) {
                      if (value == null) {
                        return "Enter a pin";
                      } else if (value.isEmpty) {
                        return "Pin cannot be empty";
                      } else if (value.length < 6) {
                        return "Pin should be 6 Digits long";
                      } else if (value != enterPinController.text) {
                        return "Pin does not match";
                      } else {
                        return null;
                      }
                    },
                    focusNode: confirmPinFocusNode,
                    controller: confirmPinController,
                    length: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      enterPinFocusNode.unfocus();
                      confirmPinFocusNode.unfocus();
                      if (doubleFormKey.currentState!.validate()) {
                        if (enterPinController.text ==
                            confirmPinController.text) {
                          context.read<AuthBloc>().add(AuthBlocEvent.enterPin(
                              pin: confirmPinController.text,
                              context: context));
                        }
                      }
                    },
                    child: const Text("Confirm"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
