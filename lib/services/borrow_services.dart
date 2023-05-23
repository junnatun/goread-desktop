import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class BorrowServices {
  // NOTE: get borrows
  static Future<List?> getBorrows() async {
    try {
      var response = await Dio().get('$baseAPIUrl/borrows');
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

// NOTE: get borrow
  static Future<List?> getBorrow(String id) async {
    try {
      var response = await Dio().get('$baseAPIUrl/borrows?id_peminjaman=$id');
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

// NOTE: untuk addBorrow
  static Future<Map?> addBorrow(
    String idUser,
    String tglPinjam,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/borrows',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'id_user': idUser,
          'tgl_pinjam': tglPinjam,
          'status': 'ongoing',
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

// NOTE: delete borrows
  static Future<Map?> deleteBorrow(
    String id,
  ) async {
    try {
      var response =
          await Dio().delete('$baseAPIUrl/borrows?id_peminjaman=$id');
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

// NOTE: Edit Borrow
  static Future<Map?> editBorrow(
    String idPeminjaman,
    String status,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/borrows?id_peminjaman=$idPeminjaman',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'status': status,
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
