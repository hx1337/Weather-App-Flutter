import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.data});

  final data;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

double lon;
double lat;
double temp;
int condition;
String cityname;

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String icon;
  String message;

  @override
  void initState() {
    updateUI(widget.data);
    super.initState();
  }

  void updateUI(dynamic data) {
    setState(() {
      lon = data['coord']['lon'];
      lat = data['coord']['lat'];
      temp = data['main']['temp'];
      message = weather.getMessage(temp);

      condition = data['weather'][0]['id'];

      icon = weather.getWeatherIcon(condition);
      cityname = data['name'];

      print(temp);
      print(condition);
      print(cityname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      initState();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                    if(typedname!=null){
                      var dat = await weather.getweather(typedname);
                      updateUI(dat);
                    }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityname',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              Text(lat.toString()),
              Text(lon.toString())
            ],
          ),
        ),
      ),
    );
  }
}
