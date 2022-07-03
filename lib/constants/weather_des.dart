// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherDescription({
  required weatherDescription,
  required Color color,
  required double size,
}) {
  switch (weatherDescription) {
    case 'Clear':
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;

    case 'Cloudy':
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
      break;

    case 'Moderate Rain':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;

    case 'Patchy rain possible':
      {
        return Icon(
          FontAwesomeIcons.cloudMoonRain,
          color: color,
          size: size,
        );
      }
      break;

    case 'Partly cloudy':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;

    case ' Light rain shower':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;

    case ' Overcast ':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;

    case ' Sunny ':
      {
        return Icon(
          FontAwesomeIcons.cloudSunRain,
          color: color,
          size: size,
        );
      }
      break;

    default:
      return const Image(
        image:
            NetworkImage('http://cdn.weatherapi.com/weather/64x64/day/113.png'),
      );
      break;
  }
}
