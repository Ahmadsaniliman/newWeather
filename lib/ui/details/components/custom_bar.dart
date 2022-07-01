import 'package:flutter/material.dart';
import 'package:newweatherapp/model/weather_model.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final WeatherModel snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(width: 65.0),
          Text(
            snapshot.location.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
