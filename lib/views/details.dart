import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/services/api_calls/update_weather_service.dart';
import '../model/city.dart';

class Details extends StatefulWidget {
  final City city;

  Details({Key? key, required this.city}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailsState(city: this.city);
  }
}

class _DetailsState extends State<Details> {
  final City city;
  _DetailsState({Key? key, required this.city});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.city.cityName}'s Weather")),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FutureBuilder<Weather>(
                future: UpdateWeatherService(city).fetchWeatherData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final iconName = snapshot.data!.subWeatherJson.icon;
                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.network(
                        'https://openweathermap.org/img/wn/$iconName.png',
                      ),
                      title: Text(snapshot.data!.main.feels_like.toString() +
                          ' degrees Celsius'),
                      subtitle: Text('Min: ' +
                          snapshot.data!.main.temp_min.toString() +
                          ' Max: ' +
                          snapshot.data!.main.temp_max.toString()),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
