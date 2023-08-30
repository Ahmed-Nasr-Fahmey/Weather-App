import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatherServic {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'f76452694613408c968141010232407';
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    weather = WeatherModel.fromjson(data);
    // ignore: empty_catches
    return weather;
  }
}
