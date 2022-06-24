import 'package:flutter/cupertino.dart';

class Weather {
  String? cityName;
  double? temp;
  String? wind;
  // ignore: non_constant_identifier_names
  double? feels_like;
  int? humidity;
  int? pressure;
  String? desc;
  String? con;
  int? vis;
  String? lon;
  String? lat;

  Weather({
    @required this.cityName,
    @required this.temp,
    @required this.wind,
    // ignore: non_constant_identifier_names
    @required this.feels_like,
    @required this.humidity,
    @required this.pressure,
    @required this.desc,
    @required this.con,
    @required this.vis,
    @required this.lon,
    @required this.lat,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json['main']['temp'];
    wind = json['wind']['speed'].toString();
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
    desc = json['weather'][0]['description'];
    con = json['sys']['country'];
    vis = json['visibility'];
    lon = json['coord']['lon'].toString();
    lat = json['coord']['lat'].toString();
  }
}

class Weathers {
  double? threeHour;
  double? sixHour;
  double? nineHour;
  double? twelveHour;
  double? fifteenHour;
  double? eighteenHour;
  double? twentyOneHour;
  double? oneDay;
  double? twoDays;
  double? threeDays;
  double? fourDays;
  double? fiveDays;
  String? desc1;
  String? desc2;
  String? desc3;
  String? desc4;
  String? desc5;
  String? desc6;
  String? desc7;
  String? desc8;
  String? desc9;
  String? desc10;
  String? desc11;
  String? desc12;

  Weathers({
    @required this.threeHour,
    @required this.sixHour,
    @required this.nineHour,
    @required this.twelveHour,
    @required this.fifteenHour,
    @required this.eighteenHour,
    @required this.twentyOneHour,
  });

  Weathers.fromJson(Map<String, dynamic> json) {
    threeHour = json['list'][0]['main']['temp'];
    desc1 = json['list'][0]['weather'][0]['description'];
    sixHour = json['list'][1]['main']['temp'];
    desc2 = json['list'][1]['weather'][0]['description'];
    nineHour = json['list'][2]['main']['temp'];
    desc3 = json['list'][2]['weather'][0]['description'];
    twelveHour = json['list'][3]['main']['temp'];
    desc4 = json['list'][3]['weather'][0]['description'];
    fifteenHour = json['list'][4]['main']['temp'];
    desc5 = json['list'][4]['weather'][0]['description'];
    eighteenHour = json['list'][5]['main']['temp'];
    desc6 = json['list'][5]['weather'][0]['description'];

    twentyOneHour = json['list'][6]['main']['temp'];
    desc7 = json['list'][6]['weather'][0]['description'];
    oneDay = json['list'][7]['main']['temp'];
    desc8 = json['list'][7]['weather'][0]['description'];
    twoDays = json['list'][14]['main']['temp'];
    desc9 = json['list'][14]['weather'][0]['description'];
    threeDays = json['list'][21]['main']['temp'];
    desc10 = json['list'][21]['weather'][0]['description'];
    fourDays = json['list'][28]['main']['temp'];
    desc11 = json['list'][28]['weather'][0]['description'];
    fiveDays = json['list'][35]['main']['temp'];
    desc12 = json['list'][35]['weather'][0]['description'];
  }
}
