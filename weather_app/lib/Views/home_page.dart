import 'package:flutter/material.dart';

import 'package:weather_app/Views/search_view.dart';
import 'package:weather_app/Widgets/no_weather.dart';
import 'package:weather_app/Widgets/weather_data.dart';

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
      body: weatherModel == null
          ? const NoWeatherBody()
          : WeatherInfoBody(weather: weatherModel!),
    );
  }
}

/*------------------bloc pattern------------------*/
//create state
//creat cubit
//create function
//provide cubit
//interact with the cubit
//triger the cubit
