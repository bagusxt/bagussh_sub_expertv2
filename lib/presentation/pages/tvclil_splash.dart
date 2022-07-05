import 'package:sub_bagussh/presentation/pages/home_movie_page.dart';
import 'package:sub_bagussh/common/constants.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const 
  routeName = '/tvclil_splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() 
  => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
{
  startTime() {
    var _duration = const Duration(seconds: 1);
    return Timer(_duration, navigationRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeMoviePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kRichBlack,
        body: Center(child: Center(child: Image.asset('assets/tvclil.png'))));
  }
}