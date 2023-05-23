import 'package:carent_app/env.dart';
import 'package:dio/dio.dart';

abstract class OverviewServices {
  // NOTE: get overview
  static Future<List?> getOverview() async {
    try {
      var response = await Dio().get('$baseAPIUrl/overview');
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
}
