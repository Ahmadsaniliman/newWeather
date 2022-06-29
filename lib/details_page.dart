import 'package:flutter/material.dart';
import 'package:newweatherapp/weather_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.snapshot,
  }) : super(key: key);
  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.location.name),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.wb_sunny,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 30.0),
                  Text(snapshot.current.condition.text),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
