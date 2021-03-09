import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'file:///C:/Users/thefatflyer/AndroidStudioProjects/weather_app/lib/views/add_city_to_list.dart';
import 'package:weather_app/services/user_weather_list_service.dart';

import 'details.dart';

class Homepage extends StatefulWidget{

  @override
  State createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'CodeDoc Weather App'
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddCityToList()),
          );
        },
        child: Icon(Icons.add)
      ),
      body: UserWeatherList()
    );
  }
}

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