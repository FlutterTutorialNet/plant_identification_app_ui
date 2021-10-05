import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPlantsScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MyPlantsScreenState();
  }

}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
           child: Text("MyPlants"),
        ),
      ),
    );
  }
}