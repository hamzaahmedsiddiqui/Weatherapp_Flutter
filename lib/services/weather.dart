import '../services/networking.dart';
import '../services/location.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Location location = Location();

  Future<dynamic> getCityWeatherData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '${kBaseWeatherUrl}q=$cityName&appid=$kApikey&units=metric');
    var decodedData = await networkHelper.getLocationWeatherData();
    return decodedData;
  }

  Future<dynamic> getLocationData() async {
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '${kBaseWeatherUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$kApikey&units=metric');
    var decodedData = await networkHelper.getLocationWeatherData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
