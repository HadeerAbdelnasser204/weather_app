import 'package:flutter/material.dart';
import 'package:weather_app/Views/search_view.dart';

import 'package:weather_app/Widgets/weather_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waether App'),
        //actions to add many widegets lke Icons, buttons, etc
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ));
              }, // Add a search icon to the app bar
              icon: const Icon(Icons.search))
        ],
      ),
      body: const WeatherInfoBody(),
    );
  }
}
