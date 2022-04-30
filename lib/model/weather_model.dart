
class Weather{

  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather({this.cityName, this.temp, this.wind, this.humidity, this.feelsLike, this.pressure,});


  Weather.fromJson(Map<String, dynamic> json) {

    cityName = json['name'] as String;
    temp = json['main']['temp'] as double;
    wind = json['wind']['speed'] as double;
    humidity = json['main']['humidity'] as int;
    feelsLike = json['main']['feels_like'] as double;
    pressure = json['main']['pressure'] as int;

  }

}