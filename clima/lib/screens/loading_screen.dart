import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/api_service.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

const apiKey = '9668f821e5d06f35e6cc2cbf59c67b15';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location lc = Location();
    await lc.getCurrentLocation();
    latitude = lc.latitude;
    longitude = lc.longitude;

    ApiService api =
        ApiService(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherdata = await api.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LocationScreen();
    }));
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
