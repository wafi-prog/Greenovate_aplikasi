
import 'package:greenovate/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthLocalDatasource {
  // Save auth data buat menyimpan data authentikasi 
  // ketika pengguna berhasil login, respons dari server akan disimpan secara lokal aggar tetap bisa digunakan walaupun aplikasi dituutup.
  Future<void> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', data.toJson());
  }

  //remove
  // ketingga pengguna data logout maka authentikasi akan dihapus.
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    if (data != null) {
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception('Data not found');
    }
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey('auth_data');
  }
}