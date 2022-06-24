import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:weather_app/screens/dev.dart';
import 'package:weather_app/provider/themes.dart';
import 'package:weather_app/screens/pro.dart';

import 'screens/body.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Bar(),
        ),
        drawer: Draw(),
        body: Search(),
      ),
    );
  }
}

class Draw extends StatelessWidget {
  const Draw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                0,
              ),
              color: Colors.lightBlue,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/menu.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Home',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.home,
                  color: Colors.pink,
                ),
              ],
            ),
            onTap: null,
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Share',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.slideshare,
                  color: Colors.green,
                ),
              ],
            ),
            onTap: () => Share.share('Download Weather App here'),
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Details',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.infoCircle,
                  color: Colors.red,
                ),
              ],
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Developer',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.userAstronaut,
                  color: Colors.purple,
                ),
              ],
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dev(),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rate us',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                ),
              ],
            ),
            onTap: null,
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
          ListTile(
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Source Code',
                  style: TextStyle(fontSize: 18, fontFamily: 'Sf'),
                ),
                Icon(
                  FontAwesomeIcons.code,
                  color: Colors.blue,
                ),
              ],
            ),
            onTap: null,
          ),
          Divider(
            thickness: 1,
            height: 5,
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({Key? key}) : super(key: key);

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
          onPressed: () => null,
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

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? loca;
  TextEditingController loc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              new LottieBuilder.asset(
                'assets/loca.json',
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(right: 80, left: 80),
                child: TextFormField(
                  controller: loc,
                  cursorColor: Colors.purple,
                  style: TextStyle(fontFamily: 'Sr', fontSize: sheight / 45),
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    // contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    prefixIcon: Icon(
                      FontAwesomeIcons.city,
                      size: 20,
                      color: Colors.purple,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    hintText: 'Enter a city name',
                  ),
                ),
              ),
              new SizedBox(
                height: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  String loca = loc.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Body(loca),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                      horizontal: sheight / 25, vertical: sheight / 90),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                ),
                child: Text(
                  'Search',
                  style: new TextStyle(
                    fontFamily: 'Apple',
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
