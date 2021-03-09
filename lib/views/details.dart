import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/thefatflyer/AndroidStudioProjects/weather_app/lib/model/city.dart';

class Details extends StatelessWidget{
  final City city;

  Details({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.city.cityName}'s Weather")),
    );
  }
}