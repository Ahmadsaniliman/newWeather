import 'dart:convert';
import 'package:http/http.dart';
import 'package:newweatherapp/weather_model.dart';
// import 'dart:developer' as devtool show log;

class Network {
  Future<WeatherModel> getWeatherInfo({required String cityName}) async {
    var finalUrl =
        'https://api.weatherapi.com/v1/forecast.json?key=5e8d1777bb5543cca1c194744222206&q=' +
            cityName +
            '&days=1&aqi=no&alerts=no';
    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    if (response.statusCode == 200) {
      // devtool.log('Url: ${Uri.encodeFull(finalUrl)}');
      // devtool.log('ok Lets go');
      // devtool.log('Weather : ${response.body}');
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
