import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/model/weather_model.dart';
import 'package:newweatherapp/util/util.dart';

class WeatherInfo2 extends StatelessWidget {
  const WeatherInfo2({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              snapshot.location.country,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            Text(
              Util.getFormattedDate(
                DateTime.fromMillisecondsSinceEpoch(
                  snapshot.location.localtimeEpoch.hashCode * 1000,
                ),
              ),
            ),
            Text(snapshot.location.tzId),
          ],
        ),
        const Icon(FontAwesomeIcons.sun, size: 100),
      ],
    );
  }
}
