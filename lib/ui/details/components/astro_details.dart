import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/model/weather_model.dart';

class AstroDetails extends StatelessWidget {
  const AstroDetails({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Astro Weather Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            astroCard(
              icon: FontAwesomeIcons.cloudArrowUp,
              size: 60,
              text: 'SunRise',
              text2: snapshot.forecast.forecastday[0].astro.sunrise,
            ),
            astroCard(
              icon: FontAwesomeIcons.cloudArrowDown,
              size: 60,
              text: 'SunSet',
              text2: snapshot.forecast.forecastday[0].astro.sunset,
            ),
          ],
        ),
      ],
    );
  }

  Container astroCard({
    required String text,
    required String text2,
    required IconData icon,
    required double size,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            size: size,
          ),
          Text(text),
          Text(text2),
        ],
      ),
    );
  }
}
