import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/city.dart';
import '../main.dart';
import 'add_city_to_list.dart';
import 'package:weather_app/services/user_weather_list_service.dart';

import 'details.dart';

class Homepage extends StatefulWidget {
  @override
  State createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CodeDoc Weather App')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddCityToList()),
              );
            },
            child: Icon(Icons.add)),
        body: UserWeatherList());
  }
}

class UserWeatherList extends StatefulWidget {
  @override
  State createState() => _UserWeatherListState();
}

class _UserWeatherListState extends State<UserWeatherList> {
  @override
  Widget build(BuildContext context) {
    print("Built");
    return FutureBuilder<List<City>>(
      future: locator.get<UserWeatherListService>().initUserCities(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemBuilder: (_, index) {
              return Dismissible(
                  key: Key(index.toString()),
                  onDismissed: (direction) {
                    locator
                        .get<UserWeatherListService>()
                        .removeCityAtIndex(index);
                    // Show a snackbar. This snackbar could also contain "Undo" actions.
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            snapshot.data![index].cityName + ' dismissed')));
                  },
                  child: ListTile(
                    title: Text(snapshot.data![index].cityName,
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Details(city: snapshot.data![index])),
                      );
                    },
                  ));
            },
            separatorBuilder: (_, __) => Divider(
              height: 1,
              color: Colors.green,
            ),
            itemCount: snapshot.data!.length,
          );
          ;
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
