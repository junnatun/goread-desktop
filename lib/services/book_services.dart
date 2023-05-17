import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class BookServices {
  // NOTE: get books
  static Future<List?> getBooks() async {
    try {
      var response = await Dio().get('$baseAPIUrl/books');
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
  static Future<List?> getBook(String id) async {
    try {
      var response = await Dio().get('$baseAPIUrl/books?id_buku=$id');
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

// NOTE: untuk addBook
  static Future<Map?> addBook(
    String judulBuku,
    String kategori,
    String stok,
    String isbn,
    String penerbit,
    String penulis,
    String thnTerbit,
    String jmlHal,
    String sinopsis,
    String cover,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/books',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'judul_buku': judulBuku,
          'kategori': kategori,
          'stok': stok,
          'isbn': isbn,
          'penerbit': penerbit,
          'penulis': penulis,
          'thn_terbit': thnTerbit,
          'jml_hal': jmlHal,
          'sinopsis': sinopsis,
          'cover': cover,
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

// NOTE: delete book
  static Future<Map?> deleteBook(
    String id,
  ) async {
    try {
      var response = await Dio().delete('$baseAPIUrl/books?id_buku=$id');
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

// NOTE: Edit Book
  static Future<Map?> editBook(
    String idBuku,
    String judulBuku,
    String kategori,
    String stok,
    String isbn,
    String penerbit,
    String penulis,
    String thnTerbit,
    String jmlHal,
    String sinopsis,
    String cover,
  ) async {
    try {
      var response = await Dio().post(
        '$baseAPIUrl/books?id_buku=$idBuku',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'judul_buku': judulBuku,
          'kategori': kategori,
          'stok': stok,
          'isbn': isbn,
          'penerbit': penerbit,
          'penulis': penulis,
          'thn_terbit': thnTerbit,
          'jml_hal': jmlHal,
          'sinopsis': sinopsis,
          'cover': cover,
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
