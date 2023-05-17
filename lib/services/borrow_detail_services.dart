import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class BorrowDetailsServices {
  // NOTE: get books
  static Future<List?> getBorrowDetails() async {
    try {
      var response = await Dio().get('$baseAPIUrl/borrow_details');
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

  // NOTE: get book
  static Future<List?> getBorrowDetail(String id) async {
    try {
      var response =
          await Dio().get('$baseAPIUrl/borrow_details?id_peminjaman=$id');
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

// NOTE: untuk add borrow detail
  static Future<Map?> addBorrowDetail(
      String idPeminjaman, String idBuku, String jumlah) async {
    try {
      print('ID Pinjam: $idPeminjaman  ID Buku : $idBuku Jumlah : $jumlah');
      var response = await Dio().post(
        '$baseAPIUrl/borrow_details',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'id_peminjaman': idPeminjaman,
          'id_buku': idBuku,
          'jumlah': jumlah,
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

// NOTE: delete borrow detail
  static Future<Map?> deleteBorrowDetail(String idP, String idB) async {
    try {
      var response = await Dio()
          .delete('$baseAPIUrl/borrow_details?id_peminjaman=$idP&id_buku=$idB');
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

// NOTE: Edit Borrow Detail
  static Future<Map?> editBorrowDetail(
    String idP,
    String idB,
    String jumlah,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/borrow_details?id_peminjaman=$idP&id_buku=$idB',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'jumlah': jumlah,
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
