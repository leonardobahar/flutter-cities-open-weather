import 'package:weather_app/util/number_utils.dart';

class Weather {
  final Coordinate coord;
  final Main main;
  final Wind wind;
  final SubWeatherJson subWeatherJson;

  Weather(this.coord, this.main, this.wind, this.subWeatherJson);
}

class Coordinate {
  final double lon;
  final double lat;

  Coordinate({required this.lon, required this.lat});

  factory Coordinate.fromJson(Map<String, dynamic> parsedJson) {
    return new Coordinate(
      lon: parsedJson['lon'],
      lat: parsedJson['lat'],
    );
  }
}

class Main {
  final double temp_min;
  final double temp_max;
  final double feels_like;
  final int pressure;
  final int humidity;

  Main(
      {required this.temp_min,
      required this.temp_max,
      required this.feels_like,
      required this.pressure,
      required this.humidity});

  factory Main.fromJson(Map<String, dynamic> parsedJson) {
    return new Main(
        temp_min: NumberUtils.checkDouble(parsedJson['temp_min']),
        temp_max: NumberUtils.checkDouble(parsedJson['temp_max']),
        feels_like: NumberUtils.checkDouble(parsedJson['feels_like']) as double,
        pressure: parsedJson['pressure'] as int,
        humidity: parsedJson['humidity'] as int);
  }
}

class Wind {
  final double speed;
  final int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> parsedJson) {
    return new Wind(
      speed: parsedJson['speed'],
      deg: parsedJson['deg'],
    );
  }
}

class SubWeatherJson {
  final String icon;

  SubWeatherJson({required this.icon});

  factory SubWeatherJson.fromJson(Map<String, dynamic> parsedJson) {
    return new SubWeatherJson(icon: parsedJson['icon']);
  }
}
