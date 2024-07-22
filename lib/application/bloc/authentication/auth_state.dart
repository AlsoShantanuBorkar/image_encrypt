import 'package:file_encrypt/application/bloc/authentication/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  factory AuthBlocState({
    @Default(AuthMethod.pin) AuthMethod authMethod,
    @Default(null) String? enteredPin,
    @Default(false) bool isAuthenticated,
    @Default(false) bool isLoading,
    @Default(false) bool isExistingUser,
    @Default(false) bool areBiometricsAvailable,
  }) = _AuthBlocState;
}
