import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var decodedData = await weatherModel.getLocationData();
    var cityName =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: decodedData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: kSpinkit,
      ),
    );
  }
}
