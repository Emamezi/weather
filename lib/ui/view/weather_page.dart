import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/ui/view/weather_page_vm.dart';
import 'package:weather/ui/widgets/weathercard.dart';
import 'package:weather/util/constants.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherPageViewModel>.reactive(
        viewModelBuilder: () => WeatherPageViewModel(),
        onModelReady: (model) {
          return model.futureToRun();
          // await model.getNewWeather();
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      // controller: _textEditingController,
                      decoration: InputDecoration(
                        labelText: 'Enter a city location',
                        prefixIcon: Icon(FontAwesomeIcons.searchLocation),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onSubmitted: (typedCityName) async {
                        // if (typedCityName.isEmpty) {
                        //   return;
                        // }
                        // await model.fetchWeatherData(typedCityName);
                        // _textEditingController.clear();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '12345',
                            style: kcityLabelTextStyle,
                          ),
                          Text(
                            'description',
                            style: kWeatherTitleTextStyle.copyWith(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            ('ABCD'),
                            style: kcityLabelTextStyle.copyWith(
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '${model.data.weather[0].description}°C',
                    style: kcityLabelTextStyle.copyWith(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: WeatherCard(
                          cardTitle: 'Pressure',
                          cardData: 'mmHg',
                        ),
                      ),
                      Expanded(
                        child: WeatherCard(
                          cardTitle: 'hummidity',
                          cardData: ' %',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
