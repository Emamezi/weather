import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../locator.dart';

import 'package:weather/core/model/weather.dart';
import 'package:weather/core/service/location_service.dart';

class Api {
  final loc = locator<LocationService>();

  static const weeather_api_key = '7ed647beb78b9e2da5daff30f3412649';
  static const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  String cityName = 'Lagos';

  Future<WeatherModel> fetchWeatherData() async {
    final url = '$weatherUrl&q=$cityName&appid=$weeather_api_key';
    try {
      final response = await http.get(url);
      if (response.body != null && response.statusCode == 200) {
        return new WeatherModel.fromJSON(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<WeatherModel> getCurrentLocationWeather() async {
    final userLoc = await loc.getUserCurrentLocation();
    final url =
        '$weatherUrl&lat=${userLoc.latitude}&lon=${userLoc.longitude}&appid=$weeather_api_key';
    try {
      final response = await http.get(url);
      print(response.body);
      if (response.body != null && response.statusCode == 200) {
        return new WeatherModel.fromJSON(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String getWeatherIcon(int description) {
    if (description < 300) {
      return '🌩';
    } else if (description < 400) {
      return '🌧';
    } else if (description < 600) {
      return '🌧';
    } else if (description < 700) {
      return '☃️';
    } else if (description < 800) {
      return '🌫';
    } else if (description == 800) {
      return '☀️';
    } else if (description <= 804) {
      return '☁️';
    } else {
      return 'Nothing';
    }
  }

  String getWeatherBackground(int description) {
    if (description < 300) {
      return 'assets/images/thunder_storm.jpeg';
    } else if (description < 600) {
      return 'assets/images/Drizzle.jpg';
    } else if (description < 700) {
      return 'assets/images/snow.jpeg';
    } else if (description < 800) {
      return 'assets/images/atmosphere.jpeg';
    } else if (description == 800) {
      return 'assets/images/clear_sky.jpg';
    } else if (description <= 804) {
      return 'assets/images/clouds.jpg';
    } else {
      return 'assets/images/sunnyday_background.jpg';
    }
  }
}
