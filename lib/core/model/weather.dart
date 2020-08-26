class WeatherModel {
  List<Weather> weather;
  Main main;

  WeatherModel({
    this.weather,
    this.main,
  });
  WeatherModel.fromJSON(Map<String, dynamic> json) {
    main = json['main'] != null ? new Main.fromJSON(json['main']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJSON(v));
      });
    }
  }
  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['main'] = this.main;
    if (weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Main {
  double temp;
  num pressure;
  num humidity;
  Main({this.temp, this.pressure, this.humidity});
  Main.fromJSON(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    return data;
  }
}

class Weather {
  int id;
  String description;
  String icon;

  Weather({this.id, this.description, this.icon});

  Weather.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
