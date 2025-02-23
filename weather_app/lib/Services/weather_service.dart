import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  final Dio dio; // Use final to make it immutable

  WeatherService([Dio? dio]) : dio = dio ?? Dio();

  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "099e6cd855724a5d8f0151609251002";
  // This method will get the current weather data for a specific city.
  Future<Weather> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city");

      return Weather.fromJson(response.data);
    } on DioError catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'An error occurred';
      throw Exception(errorMessage);
    }
  }
}
