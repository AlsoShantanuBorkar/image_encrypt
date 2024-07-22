import 'package:image_encrypt/application/bloc/authentication/auth_bloc.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_event.dart';
import 'package:image_encrypt/application/bloc/authentication/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({super.key});

  @override
  State<ResetPinScreen> createState() => _ResetPinScreenState();
}

class _ResetPinScreenState extends State<ResetPinScreen> {
  final TextEditingController enterPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  final FocusNode enterPinFocusNode = FocusNode();
  final FocusNode confirmPinFocusNode = FocusNode();

  final GlobalKey<FormState> doubleFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Reset Pin"),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Confirm Pin"),
                  Pinput(
                    validator: (value) {
                      if (value! != enterPinController.text) {
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
                          context.read<AuthBloc>().add(AuthBlocEvent.resetPin(
                              newPin: confirmPinController.text,
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
