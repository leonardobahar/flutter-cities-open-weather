import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/services/api_calls/update_weather_service.dart';
import 'package:weather_app/services/user_weather_list_service.dart';
import 'package:weather_app/views/homepage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserWeatherListService());
}

void main() {
  setupLocator();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
