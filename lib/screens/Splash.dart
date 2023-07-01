import 'package:flutter/material.dart';
import 'dart:async';
import 'Home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to home page
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: ThemeData(
            fontFamily: 'Roboto',
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ethio.png',
                  height: 300,
                  width: 400,
                ),
                SpinKitCircle(
                  color: Color.fromARGB(255, 33, 243, 114),
                  size: 60.0,
                ),
                SizedBox(height: 35),
              ])),
    );
  }
}
