import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  //create function

  Future<void> getWeather({required String cityName}) async {
    try {
      Weather weather =
          await WeatherService(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
