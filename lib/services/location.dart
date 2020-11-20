import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
    print(position);
  }
}
