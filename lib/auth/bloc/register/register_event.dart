part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
   const factory RegisterEvent.registerUser({
    required String name,
    required String email,
    required String telpon,
    required String password,
     required String passwordConfirmation,
  }) = _RegisterUserEvent;
}