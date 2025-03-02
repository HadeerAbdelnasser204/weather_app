import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  Weather? weather;

  Future<void> getWeather({required String cityName}) async {
    try {
      weather = await WeatherService(Dio()).getCurrentWeather(city: cityName);

      if (weather != null) {
        emit(WeatherLoadedState());
      } else {
        emit(WeatherFailureState());
      }
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
