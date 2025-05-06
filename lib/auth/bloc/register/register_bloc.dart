import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenovate/datasource/auth_remote_datasource.dart';
import 'package:greenovate/datasource/auth_local_datatsource.dart';
import 'package:greenovate/models/request/register_request_model.dart';
import 'package:greenovate/models/response/auth_response_model.dart';
part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.map(
        started: (_) async {},
        registerUser: (e) async {
          emit(const RegisterState.loading());

          final request = RegisterRequestModel(
            name: e.name,
            email: e.email,
            telpon: e.telpon,
            password: e.password,
            passwordConfirmation: e.passwordConfirmation,
          );

          final result = await AuthRemoteDatasources().register(request);
          if (result.isLeft()) {
            final failure = result.swap().getOrElse(() => 'Terjadi kesalahan');
            emit(RegisterState.error(failure));
          } else {
            final authData = result.getOrElse(
              () => throw Exception('Unexpected error'),
            );
            await AuthLocalDatasource().saveAuthData(authData);

            emit(RegisterState.success(authData));
          }
        },
      );
    });
  }
}
