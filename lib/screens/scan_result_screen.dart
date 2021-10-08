import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_identification_app/common/theme-util.dart';
import 'package:plant_identification_app/screens/my_plants_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Image(
          image: AssetImage("assets/icons/my-plant-add.png"),
        ),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => MyPlantsScreen())
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black54, size: 32,
                          ),
                        onTap: (){
                            Navigator.of(context).pop();
                        },
                      ),
                      Row(
                        children: [
                          Image(image: AssetImage("assets/icons/seeds.png"), width: 42,),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Text("Buy"),
                                Text("Seeds")
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rubber Plant",
                        style:TextStyle(fontSize: 28),
                      ),
                      Text(
                          "Fig Tree",
                        style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left:10),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container( child: Text("Hybrid", style: TextStyle(fontSize: 18),)),
                                    Image(image: AssetImage("assets/scan-result/hybrid.png"), width: 100,),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top:10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Plant Type", style: TextStyle(fontSize: 16, color: Colors.grey.shade700),),
                                      Text("Tree", style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top:10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Genus", style: TextStyle(fontSize: 16, color: Colors.grey.shade700),),
                                      Text("Ficus", style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top:10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Plant Type", style: TextStyle(fontSize: 16, color: Colors.grey.shade700),),
                                      Text("Tree", style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Family", style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                                      Text("Moraceae", style: TextStyle(fontSize: 24),),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Class", style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                                      Text("Magnoliopsida", style: TextStyle(fontSize: 24),),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Bloom Time", style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                                      Text("Winter", style: TextStyle(fontSize: 24),),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Lifespan", style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                                      Text("Perennial", style: TextStyle(fontSize: 24),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage("assets/scan-result/plant-back.png"),
                                width: 220,
                                height: 410,
                              ),
                            ),
                            Container(
                              child: Image(
                                image: AssetImage("assets/scan-result/rubber-plant.png"),
                                height: 436, width: 220,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description", style: TextStyle(fontSize: 24),),
                          Container(
                            width: 125,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Divider(
                              color: ThemeUtil.AccendColor,
                              height: 5, thickness: 5,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              style: TextStyle(color: Colors.black54),
                              text: "Rubber plant (Ficus elastica) is a large tree with wide, "
                                  "oval glossy leaves. Its milky white latex was used for "
                                  "making rubber before Para rubber tree came into use, "
                                  "hence the name. Rubber plant is an ornamental species, "
                                  "often grown as a houseplant in cooler climents.",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}