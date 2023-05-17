import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class BorrowReturnServices {
  // NOTE: get borrow return
  static Future<List?> getBorrowReturns() async {
    try {
      var response = await Dio().get('$baseAPIUrl/borrow_returns');
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

// NOTE: untuk add Borrow Return
  static Future<Map?> addBorrowReturn(
    String idPeminjaman,
    String tgl_kembali,
    String denda,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/borrow_returns',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'id_peminjaman': idPeminjaman,
          'tgl_kembali': tgl_kembali,
          'denda': denda,
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

// NOTE: delete borrow return
  static Future<Map?> deleteBorrowReturn(
    String id,
  ) async {
    try {
      var response =
          await Dio().delete('$baseAPIUrl/borrow_returns?id_peminjaman=$id');
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

// NOTE: Edit Borrow Return
  static Future<Map?> editBorrowReturn(
    String idPeminjaman,
    String tglKembali,
    String denda,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/borrow_returns?id_peminjaman=$idPeminjaman',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'tgl_kembali': tglKembali,
          'denda': denda,
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
