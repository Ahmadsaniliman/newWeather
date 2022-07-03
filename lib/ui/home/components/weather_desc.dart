import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/constants/weather_des.dart';
import 'package:newweatherapp/model/weather_model.dart';

class WeatherNameAndDescription extends StatelessWidget {
  const WeatherNameAndDescription({Key? key, required this.snapshot})
      : super(key: key);
  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          snapshot.location.country,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        Text(snapshot.location.name),
        const SizedBox(height: 15.0),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.amberAccent.withOpacity(0.1),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getWeatherDescription(
                        weatherDescription: snapshot.current.condition.icon,
                        color: Colors.pink,
                        size: 50.0,
                      ),
                      Column(
                        children: [
                          const Icon(FontAwesomeIcons.temperatureHigh),
                          Text(
                            '${snapshot.current.tempC} f',
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      snapshot.current.condition.text,
                      style: const TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
