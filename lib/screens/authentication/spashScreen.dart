import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/helper.dart';
import 'landingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    // var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Helper.getAssetName("logo.png", "virtual"),
                fit: BoxFit.fitWidth,
                height: screenHeight * 20,
              ),
              Text('Bite Buddies',
                  style: TextStyle(
                    fontSize: screenHeight * 3,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
