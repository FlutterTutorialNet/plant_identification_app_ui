import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_identification_app/common/theme-util.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'scan_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ThemeUtil.PrimaryColor_100,
                ThemeUtil.PrimaryColor_100,
                ThemeUtil.PrimaryColor
              ]
          ),
        ),
        child: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage("assets/home/center-shape2.png"),
                fit: BoxFit.fill,
                width: screenSize.width,
                height: screenSize.height,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
              child: Column(
                children: [
                  Text("Plant Identification", style: Theme
                      .of(context)
                      .textTheme
                      .headline4,),
                  Text("High Accuracy Engine", style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 30),
                          child: Column(
                            children: [
                              Text("96", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,),
                              Text("Scan"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, right: 30),
                          child: Column(
                            children: [
                              Text("36", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,),
                              Text("Diagnosis"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          child: Column(
                            children: [
                              Text("31", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4,),
                              Text("Plants"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70),
                    child: Stack(
                      children: [
                        Container(
                          child: Image(image: AssetImage(
                              "assets/home/brightness.png"),
                            width: 64,
                            height: 300,),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Container(
                          child: Image(image: AssetImage(
                              "assets/home/brightness-button.png"),
                            width: 64,
                            height: 64,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 200, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(image: AssetImage("assets/icons/diagnosis.png"),
                            width: 64,
                            height: 64,),
                          Text("Diagnosis")
                        ]
                    ),
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(image: AssetImage("assets/icons/history.png"),
                            width: 64,
                            height: 64,),
                          Text("History")
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: SimpleShadow(
                      child: Image(
                        image: AssetImage("assets/icons/file-browse.png"),
                        width: 72, height: 72,
                      ),
                      color: Colors.black54, sigma: 5,
                      offset: Offset(2, 2), opacity: 0.6,
                    ),
                  ),
                  Container(
                    child: SimpleShadow(
                      child: GestureDetector(
                        child: Image(
                          image: AssetImage("assets/icons/camera.png"),
                          width: 72, height: 72,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => ScanScreen()
                              )
                          );
                        },
                      ),
                      color: Colors.black54, sigma: 5,
                      offset: Offset(2, 2), opacity: 0.3,
                    ),
                  ),
                  Container(
                    child: SimpleShadow(
                      child: Image(
                        image: AssetImage("assets/icons/my-plants.png"),
                        width: 72, height: 72,
                      ),
                      color: Colors.black54, sigma: 5,
                      offset: Offset(2, 2), opacity: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}