import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScanScreenState();
  }

}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue.shade600,
            child: Text("Next Scan Screen")
        ),
      ),
    );
  }
}