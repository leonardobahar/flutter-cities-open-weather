import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/add_city_to_list.dart';
import 'package:weather_app/user_weather_list.dart';

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