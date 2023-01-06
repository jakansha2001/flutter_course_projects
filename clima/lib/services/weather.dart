import 'package:clima/services/api_service.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  final apiKey = '9668f821e5d06f35e6cc2cbf59c67b15';
  final baseURL = 'https://api.openweathermap.org/data/2.5/weather';


  Future<dynamic> getCityWeather(String cityName) async{
    ApiService api = ApiService(
      url: '$baseURL?q=$cityName&appid=$apiKey&units=metric',
    );

    var weatherData = await api.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherLocation() async {
    Location lc = Location();
    await lc.getCurrentLocation();

    ApiService api = ApiService(
      url: '$baseURL?lat=${lc.latitude}&lon=${lc.longitude}&appid=$apiKey&units=metric',
    );
    var weatherData = await api.getData();
    return weatherData;
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

  String getMessage(int temp) {
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
