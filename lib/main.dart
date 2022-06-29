import 'package:flutter/material.dart';
import 'package:newweatherapp/details_page.dart';
import 'package:newweatherapp/network.dart';
import 'package:newweatherapp/weather_model.dart';
import 'dart:developer' as devtool show log;

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherModel> data;
  String cityName = 'Mumbai';

  @override
  void initState() {
    super.initState();
    data = Network().getWeatherInfo(cityName: cityName);
    data.then((weather) {
      devtool.log(weather.location.country);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: FutureBuilder<WeatherModel>(
            future: data,
            builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onSubmitted: (value) {
                        setState(() {
                          cityName = value;
                          data = Network().getWeatherInfo(
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
                    const SizedBox(height: 10.0),
                    Text(
                      snapshot.data!.location.country,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    Text(snapshot.data!.location.name),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.amberAccent.withOpacity(0.1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.cloud, size: 100.0),
                              Column(
                                children: [
                                  const Icon(Icons.ac_unit_rounded,
                                      color: Colors.black),
                                  Text(
                                    '${snapshot.data!.current.tempC} F',
                                    style: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(snapshot.data!.current.condition.text),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 90,
                          width: 65,
                          child: Column(
                            children: [
                              const Text('Humidity'),
                              const Icon(Icons.add),
                              Text(snapshot.data!.current.humidity.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 65,
                          child: Column(
                            children: [
                              const Text('Humidity'),
                              const Icon(Icons.add),
                              Text(
                                  snapshot.data!.current.feelslikeC.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          width: 65,
                          child: Column(
                            children: [
                              const Text('Humidity'),
                              const Icon(Icons.add),
                              Text(
                                  snapshot.data!.current.pressureIn.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(snapshot: snapshot.requireData),
                          ),
                        );
                      },
                      child: const Text('See More'),
                    ),
                    Container(
                      width: 150,
                      height: 200,
                      color: Colors.green,
                      child: Column(
                        children: [
                          const Text('Mon'),
                          const Icon(Icons.account_balance),
                          Text(snapshot.data!.current.condition.text),
                          Text(snapshot.data!.current.tempC.toString()),
                          Text(snapshot.data!.current.humidity.toString()),
                        ],
                      ),
                    ),
                  ],
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
