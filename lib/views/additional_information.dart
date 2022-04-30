import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_weather_app/data/app_data.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({
    Key? key,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.feelsLike,
  }) : super(key: key);

  final String wind;
  final String humidity;
  final String pressure;
  final String feelsLike;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: ListView(
        children: <Widget>[
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.wind),
              title: Text('Vento', style: titleStyle,),
              trailing: Text(wind, style: infoStyle,)
          ),
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.compress),
              title: Text('Pressão', style: titleStyle,),
              trailing: Text(pressure, style: infoStyle,)
          ),
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.water),
              title: Text('Umidade', style: titleStyle,),
              trailing: Text(humidity, style: infoStyle,)
          ),
          ListTile(
              leading: const FaIcon(FontAwesomeIcons.thermometer),
              title: Text('Sensação Térmica', style: titleStyle,),
              trailing: Text(feelsLike, style: infoStyle,)
          ),
        ],
      ),
      ),
    );
  }
}
