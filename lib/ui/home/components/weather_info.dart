import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/model/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 90,
          width: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Humidity'),
              const Icon(FontAwesomeIcons.solidFaceGrinBeamSweat),
              Text('${snapshot.current.humidity.toStringAsFixed(0)} %'),
            ],
          ),
        ),
        SizedBox(
          height: 90,
          width: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Temp'),
              const Icon(FontAwesomeIcons.temperatureArrowDown),
              Text(snapshot.forecast.forecastday[0].day.mintempC.toString()),
            ],
          ),
        ),
        SizedBox(
          height: 90,
          width: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Temp'),
              const Icon(FontAwesomeIcons.temperatureArrowUp),
              Text(snapshot.forecast.forecastday[0].day.maxtempC.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
