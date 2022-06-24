import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=57c9ba0eab88ca4537be3be9399a3513');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}

class WeatherClient {
  Future<Weathers>? getDayWeather(String? location) async {
    var point = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$location&units=metric&appid=57c9ba0eab88ca4537be3be9399a3513');
    var resp = await http.get(point);
    var bods = jsonDecode(resp.body);

    return Weathers.fromJson(bods);
  }
}
