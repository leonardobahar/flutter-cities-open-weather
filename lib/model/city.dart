import 'dart:convert';

class City {
  final String cityName;
  final String countryCode;

  City(this.cityName, this.countryCode);

  static Map<String, dynamic> toMap(City city) => {
        'cityName': city.cityName,
        'countryCode': city.countryCode,
      };

  factory City.fromJson(Map<String, dynamic> jsonData) {
    return City(jsonData['cityName'], jsonData['countryCode']);
  }
}

class CityListUtil {
  static String encode(List<City> cityObj) => json.encode(
        cityObj
            .map<Map<String, dynamic>>((cityObj) => City.toMap(cityObj))
            .toList(),
      );

  static List<City> decode(String jsonStr) =>
      (json.decode(jsonStr) as List<dynamic>)
          .map<City>((item) => City.fromJson(item))
          .toList();
}
