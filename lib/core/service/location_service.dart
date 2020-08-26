import 'package:location/location.dart';
import 'package:weather/core/model/user_location.dart';

class LocationService {
  // final  UserLocation _userLocation;

  Future<UserLocation> getUserCurrentLocation() async {
    Location location = Location();
    final userLoc = await location.getLocation();
    final userLocation = UserLocation(
      longitude: userLoc.longitude,
      latitude: userLoc.latitude,
    );
    return userLocation;
  }
}
