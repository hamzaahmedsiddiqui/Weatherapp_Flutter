import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';

class NetworkHelper {
  NetworkHelper({this.url});

  Location location = Location();
  String url;

  Future getLocationWeatherData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonDecoded = jsonDecode(data);
      print(jsonDecoded);
      return jsonDecoded;
    } else {
      print(response.statusCode);
    }
  }
}
