import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';

import 'package:weather_app/cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final Weather weatherModel;
  // Make weather nullable for safety

  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<GetWeatherCubit>(context).weather;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weather?.description),
            getThemeColor(weather?.description)[300]!,
            getThemeColor(weather?.description)[100]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather!.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Updated at: ${weather.dateTime.hour}:${weather.dateTime.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weather.image}"),
                Text(
                  weather.temp.toString(), // Ensure it's not null
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max temp: ${weather.maxTemp.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Min temp: ${weather.minTemp.toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weather.description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
