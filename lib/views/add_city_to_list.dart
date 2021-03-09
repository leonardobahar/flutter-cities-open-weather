import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/services/user_weather_list_service.dart';

import 'homepage.dart';

class AddCityToList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CityInputState();
  }
}

class _CityInputState extends State<AddCityToList>{
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add City To My List")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insert city name',
              ),
              onSubmitted: (String value)async{
                locator.get<UserWeatherListService>().addCity(City(value, "ID"));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homepage()),
                );
              },
            ),
            RaisedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Homepage()),
              ),
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


}