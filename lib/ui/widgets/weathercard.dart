import 'package:flutter/material.dart';
import 'package:weather/util/constants.dart';

class WeatherCard extends StatelessWidget {
  final String cardTitle;
  final String cardData;

  const WeatherCard({
    this.cardTitle,
    this.cardData,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.transparent,
        // elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                cardTitle,
                style: kWeatherTitleTextStyle.copyWith(
                  fontSize: 25,
                ),
              ),
              // SizedBox(height: 25),
              FittedBox(
                child: Text(
                  cardData,
                  style: kWeatherTitleTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
