import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String url = 'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=43ea19262ee0c0d45ef1003b7fa81b5e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  Future<void> getlocation() async
  {
    Location loc = Location();
    await loc.getcurrentlocation();
    latitude = loc.latitude;
    longitude = loc.longitude;
    Networlhelper networlhelper = Networlhelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=43ea19262ee0c0d45ef1003b7fa81b5e&units=metric');
    var data = await networlhelper.getdata();

    Navigator.push((
        this.context),
        MaterialPageRoute(
            builder: (context) {
              return
                LocationScreen(data: data);
            }));

  }

  @override
  void initState() {
    getlocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitFadingFour(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
