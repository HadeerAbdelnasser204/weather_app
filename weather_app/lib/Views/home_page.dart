import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Views/search_view.dart';
import 'package:weather_app/Widgets/no_weather.dart';
import 'package:weather_app/Widgets/weather_data.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          //actions to add many widgets like Icons, buttons, etc
          actions: [
            IconButton(
                onPressed: () async {
                  weatherModel = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ),
                  );
                },
                // Add a search icon to the app bar
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: weatherModel!);
          } else {
            return const Center(child: Text('Oops! Something went wrong!'));
          }
        }));
  }
}

/*------------------bloc pattern------------------*/
//create state
//creat cubit
//create function
//provide cubit
//interact with the cubit
//triger the cubit
