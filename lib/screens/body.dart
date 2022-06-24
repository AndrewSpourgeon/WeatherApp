import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  WeatherApiClient client = WeatherApiClient();
  WeatherClient clients = WeatherClient();
  Weather? data;
  Weathers? days;
  String? l;
  Shader lg = LinearGradient(
    colors: <Color>[
      Color(0xff0027FF),
      Color(0xffFF53BD),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 150.0, 70.0));

  Shader bwlg = LinearGradient(
    colors: <Color>[
      Color(0xff11998E),
      Color(0xffFCEE21),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 150.0, 70.0));

  Body(this.l);

  Future<void> getData() async {
    try {
      data = await client.getCurrentWeather(l);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> getDays() async {
    days = await clients.getDayWeather(l);
  }

  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Draw(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Bodybar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Right now at',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Sr',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              // Lottie.asset('assets/celeb.json', height: 150, width: 150),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '${data!.cityName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: sheight / 29,
                                  fontFamily: 'Sr',
                                  foreground: Paint()..shader = lg,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/loc.png',
                                height: 25,
                              )
                              // Lottie.asset('assets/celeb.json', height: 150, width: 150),
                            ],
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 9),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Country :',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Sr',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${data!.con}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Sr',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                FontAwesomeIcons.globe,
                                color: Colors.green,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(40),
                          child: Container(
                            height: sheight / 2.8,
                            width: sheight / 2.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/tem.jpg'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new SizedBox(
                                  height: 10,
                                ),
                                new Text(
                                  'Temperature:',
                                  style: TextStyle(
                                    fontFamily: 'Sr',
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                new SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text(
                                      '${data!.temp}',
                                      style: TextStyle(
                                        fontFamily: 'Sr',
                                        fontSize: sheight / 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    new Text(
                                      '℃',
                                      style: TextStyle(
                                        fontFamily: 'Sr',
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                new SizedBox(
                                  height: 20,
                                ),
                                new Text(
                                  '${data!.desc}',
                                  style: TextStyle(
                                    fontFamily: 'Sr',
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Other elements',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: sheight / 39,
                                  fontFamily: 'Sr',
                                  foreground: Paint()..shader = lg,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(
                                FontAwesomeIcons.ethereum,
                                size: sheight / 45,
                              )
                              // Lottie.asset('assets/celeb.json', height: 150, width: 150),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            height: sheight / 8,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/wind.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Wind',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.wind}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Humidity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.humidity}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Pressure',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.pressure}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Feels like',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.feels_like}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Visibility',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.vis}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Longitude',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.lon}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Latitude',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      new Text(
                                        '${data!.lat}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sheight / 45,
                                            color: Colors.white,
                                            fontFamily: 'Sr'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FutureBuilder(
                            future: getDays(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 40.0, top: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'In next few hours',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: sheight / 39,
                                                fontFamily: 'Sr',
                                                foreground: Paint()
                                                  ..shader = lg,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.hourglassHalf,
                                              size: sheight / 45,
                                            )
                                            // Lottie.asset('assets/celeb.json', height: 150, width: 150),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: Container(
                                          height: sheight / 8,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade300),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '3 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.threeHour}' +
                                                            "℃",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc1}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '6 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.sixHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc2}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '9 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.nineHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc3}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '12 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.twelveHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc4}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '15 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.fifteenHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc5}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '18 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.eighteenHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc6}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff0027FF),
                                                        Color(0xffFF53BD),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '21 hours',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.twentyOneHour}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc7}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 40.0, top: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'In next few days',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: sheight / 39,
                                                fontFamily: 'Sr',
                                                foreground: Paint()
                                                  ..shader = bwlg,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.stopwatch,
                                              size: sheight / 45,
                                            )
                                            // Lottie.asset('assets/celeb.json', height: 150, width: 150),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: Container(
                                          height: sheight / 8,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.shade300),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff11998E),
                                                        Color(0xffFCEE21),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '1 day',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.oneDay}' + '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc8}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff11998E),
                                                        Color(0xffFCEE21),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '2 days',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.twoDays}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc9}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff11998E),
                                                        Color(0xffFCEE21),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '3 days',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.threeDays}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc10}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff11998E),
                                                        Color(0xffFCEE21),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '4 days',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.fourDays}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc11}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: sheight / 9,
                                                  width: sheight / 9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey.shade300,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff11998E),
                                                        Color(0xffFCEE21),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new Text(
                                                        '5 days',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.fiveDays}' +
                                                            '℃',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 52,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Text(
                                                        '${days?.desc12}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize:
                                                                sheight / 70,
                                                            color: Colors.white,
                                                            fontFamily: 'Sr'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Container();
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: LottieBuilder.asset(
                            'assets/cyc.json',
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: sheight / 6, bottom: sheight / 6),
                    child: LottieBuilder.asset(
                      'assets/load.json',
                      height: sheight / 2,
                      width: sheight / 2,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Enter valid city"),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Bodybar extends StatelessWidget {
  const Bodybar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images.jpg'),
                  fit: BoxFit.fitWidth)),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        'Weather App',
        style: TextStyle(fontFamily: "Sf", fontSize: 27, color: Colors.white),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 10,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FontAwesomeIcons.searchLocation,
            color: Colors.white,
          ),
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
