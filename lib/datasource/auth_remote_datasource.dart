
import 'package:dartz/dartz.dart';
import 'package:greenovate/constans/variable.dart';
import 'package:greenovate/datasource/auth_local_datatsource.dart';
import 'package:greenovate/models/request/login_request.dart';
import 'package:greenovate/models/request/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

// ini buat login
class AuthRemoteDatasources {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authData.token}'
        });
    if (response.statusCode == 200) {
      return Right('Logout Success');
    } else {
      return Left(response.body);
    }
  }
}
