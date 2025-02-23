//search view
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search city',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: TextField(
          //onChanged:(value){}, بتاخد القيمة كل شوية ما بتنتظر الانتهاء

          onSubmitted: (value) async {
            weatherModel =
                await WeatherService(Dio()).getCurrentWeather(city: value);
            log(weatherModel!.cityName);
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Enter city name',
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )),
      ),
    );
  }
}

Weather? weatherModel;
