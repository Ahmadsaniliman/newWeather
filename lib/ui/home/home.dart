import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newweatherapp/ui/details/details_page.dart';
import 'package:newweatherapp/model/weather_model.dart';
import 'package:newweatherapp/ui/home/components/weather_desc.dart';
import 'package:newweatherapp/ui/home/components/weather_info.dart';
import 'package:newweatherapp/util/util.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.snapshot}) : super(key: key);
  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        WeatherNameAndDescription(snapshot: snapshot),
        const SizedBox(height: 20.0),
        WeatherInfo(snapshot: snapshot),
        const SizedBox(height: 20.0),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(snapshot: snapshot),
                      ),
                    );
                  },
                  child: const Text('See More'),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    7,
                    (index) => weatherCard(index: index),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container weatherCard({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.all(8),
      height: 170,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            Util.getFormattedDate(
              DateTime.fromMillisecondsSinceEpoch(
                  snapshot.forecast.forecastday[0].dateEpoch * 1000),
            ).toString(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(FontAwesomeIcons.temperatureFull),
              Text(snapshot.current.tempC.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(FontAwesomeIcons.wind),
              Text(snapshot.current.windDegree.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(FontAwesomeIcons.diamondTurnRight),
              Text(snapshot.current.windDir.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
