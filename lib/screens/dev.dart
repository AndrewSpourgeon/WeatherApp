import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Dev extends StatefulWidget {
  @override
  _DevState createState() => _DevState();
}

class _DevState extends State<Dev> {
  Shader lg = LinearGradient(
    colors: <Color>[
      Color(0xff0027FF),
      Color(0xffFF53BD),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 50.0));
  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 80,
                  bottom: 30,
                ),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/drew.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    'Andrew Spourgeon',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      fontFamily: 'Sr',
                      foreground: Paint()..shader = lg,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  new Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: sheight / 27,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              new Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.play_arrow,
                      size: sheight / 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Android Developer',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Sr',
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: 6,
                    ),
                    new Icon(
                      FontAwesomeIcons.android,
                      color: Colors.green,
                      size: sheight / 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.play_arrow,
                      size: sheight / 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'iOS app Developer',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Sr',
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: 6,
                    ),
                    new Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.black,
                      size: sheight / 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.play_arrow,
                      size: sheight / 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Sr',
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: 6,
                    ),
                    new Image(
                      image: AssetImage('assets/flu.png'),
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.play_arrow,
                      size: sheight / 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Photo Editor',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Sr',
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: 6,
                    ),
                    new Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.purple,
                      size: sheight / 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.play_arrow,
                      size: sheight / 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Video Editor',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'Sr',
                        color: Colors.black,
                      ),
                    ),
                    new SizedBox(
                      width: 6,
                    ),
                    new Icon(
                      FontAwesomeIcons.video,
                      color: Colors.orange,
                      size: sheight / 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              new Text(
                'Contact Details:',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Sr'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch('https://wa.me/916303961320'),
                            child: SvgPicture.asset(
                              'assets/whatsapp.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch(
                                'https://discordapp.com/users/736161218577825842'),
                            child: SvgPicture.asset(
                              'assets/discord.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch(
                                'https://www.instagram.com/andrew_spourgeon/'),
                            child: SvgPicture.asset(
                              'assets/instagram.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: null,
                            child: SvgPicture.asset(
                              'assets/gmail.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch('tel://+91630391320'),
                            child: SvgPicture.asset(
                              'assets/call.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sheight / 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(
                          child: GestureDetector(
                            onTap: () =>
                                launch('https://twitter.com/ASpourgeon'),
                            child: SvgPicture.asset(
                              'assets/twitter.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () =>
                                launch('https://github.com/AndrewSpourgeon'),
                            child: SvgPicture.asset(
                              'assets/github.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch(
                                'https://www.linkedin.com/in/andrew-spourgeon-829458205/'),
                            child: SvgPicture.asset(
                              'assets/linkedin.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch(
                                'https://play.google.com/store/apps/developer?id=Andrew+Spourgeon'),
                            child: Image.asset(
                              'assets/playstore.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Container(
                          child: GestureDetector(
                            onTap: () => launch(
                                'https://www.facebook.com/profile.php?id=100008269328597'),
                            child: SvgPicture.asset(
                              'assets/facebook.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
