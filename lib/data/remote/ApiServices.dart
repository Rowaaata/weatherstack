import 'dart:convert';


import 'Constants.dart';

import 'package:weatherstack/model/weather_response.dart';
import 'package:weatherstack/model/WeatherException.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiServices {
  Future<WeatherResponse> getWeather(String city) async {
    Response response = await http
        .get(Uri.parse("$BASE_URL/current?access_key=$ACCESS_KEY&query=$city"));
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);
     return WeatherResponse.fromJson(jsonDecode);
    } else {
      print("Error ${response.statusCode}");
      throw WeatherException.checkStatus(response.statusCode);
    }
  }
}
