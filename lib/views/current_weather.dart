import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key, required this.icon, required this.temp, required this.location}) : super(key: key);

  final IconData icon;
  final String temp;
  final String location;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.orange,
            size: 64,
          ),
          const SizedBox(height: 10,),
          Text(temp, style: const TextStyle(fontSize: 46),),
          const SizedBox(height: 10,),
          Text(location, style: const TextStyle(fontSize: 18, color: Colors.grey),)
        ],
      ),
    );
  }
}
