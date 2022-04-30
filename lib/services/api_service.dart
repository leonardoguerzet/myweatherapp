import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_weather_app/model/weather_model.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? location) async {

    var endpoint = Uri.parse(
        'YOUR_API_KEY');

    var response = await http.get(endpoint);

    var body = jsonDecode(response.body);

    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);


  }
}
