import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/model/weather_model.dart';

class BottomDetails extends StatelessWidget {
  const BottomDetails({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bottomCard(
            text: 'Rain',
            icon: FontAwesomeIcons.cloudRain,
            text2:
                '${snapshot.forecast.forecastday[0].day.dailyChanceOfRain.toString()} %',
          ),
          bottomCard(
            text: 'Snow',
            icon: FontAwesomeIcons.cloudflare,
            text2:
                '${snapshot.forecast.forecastday[0].day.dailyChanceOfSnow.toString()} %',
          ),
          bottomCard(
            text: 'Wind',
            icon: FontAwesomeIcons.wind,
            text2: '${snapshot.current.windKph} kph',
          ),
          bottomCard(
            text: 'wing',
            icon: FontAwesomeIcons.wind,
            text2: '${snapshot.current.windMph} mph',
          ),
        ],
      ),
    );
  }

  Container bottomCard({
    required String text,
    required IconData icon,
    required String text2,
  }) {
    return Container(
      width: 67,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text),
          Icon(icon),
          Text(text2),
        ],
      ),
    );
  }
}
