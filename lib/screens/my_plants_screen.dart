import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_identification_app/common/theme-util.dart';
import 'package:plant_identification_app/screens/parts/my_plants_view.dart';

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
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios,size: 36,),
                        Text("My Plants", style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/icons/plant.png"),
                      width: 64,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: ThemeUtil.PrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                ),
              ),
              Expanded(
                child: MyPlantsView(
                    [
                      MyPlantsModel(
                          title: "Alovera Plant",
                          subtitle: "Ficus elestics",
                          waterText: "Every 7-10 days",
                          waterIcon: "assets/icons/water-drop.png",
                          footerText: "Plant Added at Oct 09 2021",
                          footerIcon: "",
                          envText: "Partial Sun",
                          envIcon: "assets/icons/sun-rise.png",
                          plantImage: "assets/my-plants/alovera.png"
                      ),
                      MyPlantsModel()
                        ..plantImage = "assets/my-plants/rubber.png"
                        ..title = "Rubber Plant"
                        ..subtitle = "Ficus elestics"
                        ..envIcon = "assets/icons/sun-rise.png"
                        ..envText = "Partial Sun"
                        ..waterText = "Every 7-10 days"
                        ..waterIcon = "assets/icons/water-drop.png"
                        ..footerText = "Plant added at Sep 25 2021"
                        ..footerIcon = "assets/icons/my-plant-add.png",
                      MyPlantsModel(
                          plantImage: "assets/my-plants/alovera.png",
                          envIcon: "assets/icons/sun-rise.png",
                          envText: "Partial Sun",
                          footerIcon: "assets/icons/my-plant-add.png",
                          footerText: "Plant added at Sep 24 2021",
                          subtitle: "Ficus elestics",
                          title: "Alovera Plant",
                          waterIcon: "assets/icons/water-drop.png",
                          waterText: "Plant added at Sep 24 2021"
                      ),
                      MyPlantsModel(
                          plantImage: "assets/my-plants/alovera.png",
                          envIcon: "assets/icons/sun-rise.png",
                          envText: "Partial Sun",
                          footerIcon: "assets/icons/my-plant-add.png",
                          footerText: "Plant added at Sep 24 2021",
                          subtitle: "Ficus elestics",
                          title: "Alovera Plant",
                          waterIcon: "assets/icons/water-drop.png",
                          waterText: "Plant added at Sep 24 2021"
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}