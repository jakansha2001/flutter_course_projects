import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void pageRoute(dynamic weatherData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  void getLocation() async {
    final weatherData = await WeatherModel().getWeatherLocation();
    pageRoute(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      )),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       getLocation();
      //       //Get the current location
      //     },
      //     child: const Text('Get Location'),
      //   ),
      // ),
    );
  }
}
