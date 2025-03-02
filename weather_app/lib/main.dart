import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weather
                      ?.description),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }

  condition = condition.toLowerCase(); // Normalize input

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.orange;
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return Colors.grey;
  } else if (condition.contains('mist') || condition.contains('fog')) {
    return Colors.blueGrey;
  } else if (condition.contains('rain') || condition.contains('drizzle')) {
    return Colors.blue;
  } else if (condition.contains('freezing rain') ||
      condition.contains('sleet')) {
    return Colors.teal;
  } else if (condition.contains('snow') || condition.contains('blizzard')) {
    return Colors.indigo;
  } else if (condition.contains('ice pellets')) {
    return Colors.cyan;
  } else if (condition.contains('shower')) {
    return Colors.lightBlue;
  } else if (condition.contains('thunder')) {
    return Colors.deepOrange;
  } else {
    return Colors.blueGrey; // Default color
  }
}
