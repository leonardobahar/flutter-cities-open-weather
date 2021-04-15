import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/city.dart';

class UserWeatherListService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<City> cityList = [
    City("Jakarta", "ID"),
    City("Bangkok", "TH"),
    City("New York", "US"),
    City("Berlin", "DE"),
    City("Sydney", "AU")
  ];

  UserWeatherListService() {
    print("Created once");
    // initUserCities();
  }

  Future<List<City>> initUserCities() async {
    final SharedPreferences prefs = await _prefs;
    final cities = await getCities();
    if (cities.isEmpty) {
      final encodedCityList = CityListUtil.encode(cityList);
      prefs.setString('user_cities', encodedCityList);
      return cityList;
    } else {
      cityList = cities;
      return getCities();
    }
  }

  Future<void> _setUserCities() async {
    final SharedPreferences prefs = await _prefs;
    final encodedCityList = CityListUtil.encode(cityList);
    prefs.setString('user_cities', encodedCityList);
  }

  Future<List<City>> getCities() async {
    final SharedPreferences prefs = await _prefs;

    final prefResponse = prefs.getString('user_cities') ?? "";
    if (prefResponse != "") {
      return CityListUtil.decode(prefResponse);
    } else {
      return [];
    }
  }

  void removeCityAtIndex(int index) {
    cityList.removeAt(index);
    _setUserCities();
  }

  void addCity(City city) {
    cityList.add(city);
    print("Added city ${city.cityName}");
    print(cityList);
    _setUserCities();
  }
}
