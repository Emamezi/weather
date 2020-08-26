import 'package:stacked/stacked.dart';

import 'package:weather/locator.dart';

import 'package:weather/core/model/weather.dart';
import 'package:weather/core/service/weatherservice.dart';

class WeatherPageViewModel extends FutureViewModel<WeatherModel> {
  final _api = locator<Api>();

  WeatherModel _weatherModel;
  int get getWeatherModel => _weatherModel.weather[0].id;
  @override
  Future<WeatherModel> futureToRun() async {
    WeatherModel weatherData = await _api.getCurrentLocationWeather();
    _weatherModel = weatherData;
    print(weatherData.main.humidity);
    // notifyListeners();
    return weatherData;
    // _weatherModel = weatherData;
  }

  Future getNewWeather() async {
    var newCityWeather = await _api.fetchWeatherData();
    _weatherModel = newCityWeather;
    notifyListeners();
  }
}
