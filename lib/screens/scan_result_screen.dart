import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanResultScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ScanResultScreenState();
  }

}

class _ScanResultScreenState extends State<ScanResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Scan Result"),
        ),
      ),
    );
  }
}