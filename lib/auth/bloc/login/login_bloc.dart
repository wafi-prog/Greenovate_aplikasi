import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenovate/datasource/auth_remote_datasource.dart';
import 'package:greenovate/models/request/login_request.dart';
import 'package:greenovate/models/response/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
   final AuthRemoteDatasources authRemoteDatasources;
  LoginBloc(this.authRemoteDatasources) : super(_Initial()) {
    on<_Login>((event, emit) async {
     emit(_loading());
     final dataRequest = LoginRequestModel(
      email: event.email,
      password: event.password,
     );

     final response = await authRemoteDatasources.login(dataRequest);
     response.fold((error) => emit(_Error(error)),
     (data) => emit(_Success(data)),
     );
    });
  }
}
