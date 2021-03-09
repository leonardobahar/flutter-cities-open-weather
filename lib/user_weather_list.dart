import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/city.dart';
import 'package:weather_app/details.dart';
import 'package:weather_app/services/user_weather_list_service.dart';

import 'main.dart';

class UserWeatherList extends StatefulWidget {

  @override
  State createState() {
    return _UserWeatherListState();
  }

}

class _UserWeatherListState extends State<UserWeatherList>{
  late List cityList;

  @override
  void initState() {
    this.cityList = locator.get<UserWeatherListService>().getCities();
  }

  void updateCities(){
    this.cityList = locator.get<UserWeatherListService>().getCities();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
     print("Built");
    return Builder(
      builder: (_){
       // this.cityList = locator.get<UserWeatherListService>().getCities();

        return ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                  cityList[index].cityName,
                  style: TextStyle(color: Theme
                      .of(context)
                      .primaryColor)
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(city: cityList[index])),
                );
              },
            );
          },
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green,),
          itemCount: cityList.length,
        );
      },
    );
  }
}