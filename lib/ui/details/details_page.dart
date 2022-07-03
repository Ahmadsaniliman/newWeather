import 'package:flutter/material.dart';
import 'package:newweatherapp/model/weather_model.dart';
import 'package:newweatherapp/ui/details/components/astro_details.dart';
import 'package:newweatherapp/ui/details/components/bottom_bar.dart';
import 'package:newweatherapp/ui/details/components/bottom_details.dart';
import 'package:newweatherapp/ui/details/components/weather_info_2.dart';

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
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   CustomBar(snapshot: snapshot),
              const SizedBox(height: 20.0),
              WeatherInfo2(snapshot: snapshot),
              const SizedBox(height: 30.0),
              AstroDetails(snapshot: snapshot),
              const SizedBox(height: 15.0),
              BottomDetails(snapshot: snapshot),
            ],
          ),
        ),
      ),
    );
  }
}
