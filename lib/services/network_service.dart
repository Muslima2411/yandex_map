import 'package:dio/dio.dart';

class NetService {
  static const baseURL = "https://suggest-maps.yandex.ru/v1/suggest?";
  static const apiKey = "5aff552f-75ea-451f-a760-8c89205a0317";

  static final dio = Dio();

  static Future<String?> searchLocation(String loc) async {
    try {
      final result = await dio.get(
        baseURL,
        queryParameters: {'apikey': apiKey, 'text': loc},
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return result.data.toString();
      }
    } catch (e) {
      print('Error in fetchData: $e');
    }
    return null;
  }
}
