import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class MemberServices {
  // NOTE: get members
  static Future<List?> getMembers() async {
    try {
      var response = await Dio().get('$baseAPIUrl/members');
      if (response.statusCode == 200) {
        if (response.data['status'] == 1) {
          return response.data['data'];
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

// NOTE: untuk method post addUser
  static Future<Map?> addUser(
    String username,
    String pass,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/users',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'username': username,
          'pass': pass,
        },
      );

      if (response.statusCode == 200) {
        return {
          'message': response.data['message'],
          'id': response.data['id'],
        };
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

// NOTE: untuk addMember
  static Future<Map?> addMember(
    String idUser,
    String nama,
    String jk,
    String tglLahir,
    String telp,
    String pekerjaan,
    String alamat,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/members',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'id_user': idUser,
          'nama': nama,
          'jenis_kelamin': jk,
          'tgl_lahir': tglLahir,
          'profesi': pekerjaan,
          'alamat': alamat,
          'telp': telp,
        },
      );

      if (response.statusCode == 200) {
        return {
          'message': response.data['message'],
        };
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

// NOTE: delete member
  static Future<Map?> deleteMember(
    String id,
  ) async {
    try {
      var response = await Dio().delete('$baseAPIUrl/users?id_user=$id');
      if (response.statusCode == 200) {
        if (response.data['status'] == 1) {
          return {
            // Key : Value
            'message': response.data['message'],
          };
        } else {
          return null;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

// NOTE: Edit Member
  static Future<Map?> editMember(
    String idUser,
    String nama,
    String jk,
    String tglLahir,
    String telp,
    String pekerjaan,
    String alamat,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/members?id_user=$idUser',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'nama': nama,
          'jenis_kelamin': jk,
          'tgl_lahir': tglLahir,
          'telp': telp,
          'profesi': pekerjaan,
          'alamat': alamat,
        },
      );

      if (response.statusCode == 200) {
        return {
          'message': response.data['message'],
        };
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
