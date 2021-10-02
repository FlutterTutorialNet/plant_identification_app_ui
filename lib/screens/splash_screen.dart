import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_identification_app/common/theme-util.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }

}

class _SplashScreenState extends State<SplashScreen> {

  late Timer animTimer;
  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    _width = 0;
    _height = 0;

    Future.delayed(Duration(milliseconds: 100), (){
      setState(() {
        _width = 300;
        _height = 300;
      });
    });

    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        _width = 0;
        _height = 0;
      });
    });

    Future.delayed(Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutSine,
          width: _width,
          height: _height,
          child: Container(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            child: SimpleShadow(
              child: Image(image: AssetImage("assets/flutter-tutorial-logo.png"), width: 260, height:260,),
              opacity: 0.7,
              color: Colors.black54,
              offset: Offset(2,2),
              sigma: 8,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeUtil.PrimaryColor,
                    ThemeUtil.PrimaryColor_100,
                  ]
              )
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            ThemeUtil.PrimaryColor_100,
            ThemeUtil.PrimaryColor,
          ]
        )
      ),
    );
  }
}