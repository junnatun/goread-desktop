import 'package:carent_app/env.dart';
import 'package:carent_app/models/active_user.dart';
import 'package:dio/dio.dart';

abstract class LoginServices {
  // NOTE: get user to login
  static Future<ActiveUser?> login(
    String email,
    String passwd,
  ) async {
    try {
      var response =
          await Dio().get('$baseAPIUrl/login?email=$email&passwd=$passwd');
      if (response.statusCode == 200) {
        if (response.data['status'] == 1) {
          return ActiveUser(
            idUser: response.data['data'][0]['id_user'],
            email: response.data['data'][0]['email'],
            role: response.data['data'][0]['role'],
          );
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

// NOTE: untuk method post ternyata
  // static Future<ActiveUser?> createActiveUser(
  //   String email,
  //   String idUser,
  //   String role,
  // ) async {}
}
