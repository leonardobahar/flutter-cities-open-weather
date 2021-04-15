import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/weather.dart';

class UpdateWeatherService {
  final City city;

  UpdateWeatherService(this.city);

  final String apiKey = '6fd254392eb10d3298ac4ce720efc54a';

  Future<Weather> fetchWeatherData() async {
    String cityName = city.cityName;
    final queryParameters = {'q': cityName, 'appid': apiKey, 'units': 'metric'};
    final response = await http.get(Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse["main"]);
      final main = Main.fromJson(jsonResponse["main"]);
      final coord = Coordinate.fromJson(jsonResponse['coord']);
      final wind = Wind.fromJson(jsonResponse['wind']);
      final subWeather = SubWeatherJson.fromJson(jsonResponse['weather'][0]);
      final weather = Weather(coord, main, wind, subWeather);
      return weather;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
