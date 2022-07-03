import 'package:flutter/material.dart';
import 'package:newweatherapp/network/network.dart';
import 'package:newweatherapp/model/weather_model.dart';
import 'package:newweatherapp/ui/home/home.dart';
import 'package:newweatherapp/ui/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(),
      home: const WelcomeView(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherModel> dataWeather;
  String cityName = 'Mumbai';

  @override
  void initState() {
    super.initState();
    dataWeather = Network().getWeatherInfo(cityName: cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: FutureBuilder<WeatherModel>(
            future: dataWeather,
            builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        onSubmitted: (value) {
                          setState(() {
                            cityName = value;
                            dataWeather = Network().getWeatherInfo(
                              cityName: cityName,
                            );
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 15.0,
                          ),
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Enter Your City Name',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Body(snapshot: snapshot.requireData),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
