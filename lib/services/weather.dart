import 'package:clima/services/networking.dart';

class WeatherModel {


  Future<dynamic> getweather(String city) async{
    var url='http://api.openweathermap.org/data/2.5/weather?q=$city&appid=43ea19262ee0c0d45ef1003b7fa81b5e&units=metric';
  Networlhelper net=Networlhelper(url);
  var data=await net.getdata();
  return data;
  }




  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
