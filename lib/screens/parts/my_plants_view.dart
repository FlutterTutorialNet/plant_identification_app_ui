import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_identification_app/common/theme-util.dart';

class MyPlantsModel{
  String plantImage;
  String title;
  String subtitle;

  String envIcon;
  String envText;
  String waterIcon;
  String waterText;

  String footerText;
  String footerIcon;

  MyPlantsModel(
      {this.plantImage = "",
        this.title = "",
        this.subtitle = "",
        this.envText = "",
        this.envIcon = "",
        this.footerIcon = "",
        this.footerText = "",
        this.waterIcon = "",
        this.waterText = ""}
      );
}

class MyPlantsView extends StatefulWidget{

  List<MyPlantsModel> _models = [];
  MyPlantsView(List<MyPlantsModel> models){
    _models = models;
  }

  @override
  State<StatefulWidget> createState() {
    return _MyPlantsViewState(_models);
  }

}

class _MyPlantsViewState extends State<MyPlantsView>{

  late List<MyPlantsModel> _models;
  _MyPlantsViewState(List<MyPlantsModel> models){
    _models = models;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _models.length,
        itemBuilder: (BuildContext context, int index) {
          var model = _models[index];
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ThemeUtil.PrimaryColor_100,
                            ThemeUtil.PrimaryColor
                          ]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(model.plantImage),
                              width: 120, height: 120,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(model.title, style: TextStyle(fontSize: 20),),
                                          Text(model.subtitle, style: TextStyle(fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: AssetImage(model.envIcon),
                                            width: 20, height: 20,
                                          ),
                                          Text(model.envText),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: AssetImage(model.waterIcon),
                                            width: 20, height: 20,
                                          ),
                                          Text(model.waterText),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5,
                        thickness: 2,
                        color: ThemeUtil.PrimaryColor,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(model.footerText),
                            Icon(Icons.playlist_add, size: 26,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}