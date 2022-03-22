import 'package:flutter/material.dart';

import 'package:weatherstack/model/weather_response.dart';

import 'data/remote/ApiServices.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherResponse? response;

  @override
  void initState() {
    ApiServices().getWeather("cairo,eg").then((value) {
      setState(() {
        response = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: response != null
              ? Column(
                  children: [
                    Image.network(response?.current?.weather_icons![0]),
                    Text('${response?.current?.temperature}'),
                    Text(response?.current?.weather_descriptions![0])
                  ],
                )
              : Text('loading...'),
        ),
      ),
    );
  }
}
