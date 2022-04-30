import 'package:flutter/material.dart';
import 'package:live_weather_app/model/weather_model.dart';
import 'package:live_weather_app/services/api_service.dart';
import 'package:live_weather_app/views/additional_information.dart';
import 'package:live_weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApi client = WeatherApi();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather('Vitoria');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'WEATHER APP',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
         ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CurrentWeather(
                      icon: Icons.wb_sunny_rounded,
                      temp: '${data!.temp!.toInt()}°C',
                      location: '${data!.cityName}'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(),
                  AdditionalInformation(
                      wind: '${data!.wind} km/h',
                      humidity: '${data!.humidity}%',
                      pressure: '${data!.pressure} hPa',
                      feelsLike: '${data!.feelsLike!.toInt()}°C'),
                ],
              );
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
