import '../model/city.dart';

class UserWeatherListService{
  List<City> cityList = [
    City("Jakarta", "ID"),
    City("Bangkok", "TH"),
    City("New York", "US"),
    City("Berlin", "DE"),
    City("Sydney", "AU")
  ];

  UserWeatherListService(){
    print("Created once");
  }
  
  List<City> getCities(){
    return cityList;
  }
  
  void addCity(City city){
    cityList.add(city);
    print("Added city ${city.cityName}");
    print(cityList);
  }
}