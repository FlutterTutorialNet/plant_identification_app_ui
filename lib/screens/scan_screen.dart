import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plant_identification_app/common/theme-util.dart';

import 'my_plants_screen.dart';
import 'scan_result_screen.dart';

class ScanScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScanScreenState();
  }
}

class _ScanScreenState extends State<ScanScreen> {

  CameraController? cameraController;
  late List cameras;
  late int selectedCameraIndex;
  late String imgPath;

  Future initCamera(CameraDescription cameraDescription) async {

    if (cameraController != null) {
      await cameraController?.dispose();
    }

    cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    cameraController?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController!.value.hasError) {
      print('Camera Error ${cameraController!.value.errorDescription}');
    }

    try {
      await cameraController?.initialize();
    } catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget cameraPreview() {

    if (cameraController != null && !cameraController!.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    cameraController?.unlockCaptureOrientation().then((value) => null);
    cameraController?.setExposureMode(ExposureMode.locked);

    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return Transform.scale(
      scale: 1.0,
      child: Container(
        padding: EdgeInsets.only(top:6, left:3),
        margin: EdgeInsets.only(left:0),
        width: 370,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: AspectRatio(
            aspectRatio: 1.2,
            child: CameraPreview(cameraController!),
          ),
        ),
      ),
    );
  }

  Widget cameraControl(context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                onCapture(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget cameraToggle() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: () {
              onSwitchCamera();
            },
            icon: Icon(
              getCameraLensIcons(lensDirection),
              color: Colors.white,
              size: 24,
            ),
            label: Text(
              '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      await cameraController?.takePicture().then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ScanResultScreen()));
      });

    } catch (e) {
      print(e);
    }
  }

  getCameraLensIcons(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex =
    selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    initCamera(selectedCamera);
  }

  @override
  void initState() {

    super.initState();

    print("init state is called");

    availableCameras().then((value) {
      cameras = value;
      if(cameras.length > 0){
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {
          print("Cam initialized");
        });
      } else {
        print('No camera available');
      }

    }).catchError((e){
      print('Error : ${e.code}');
    });
  }



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeUtil.PrimaryColor_100,
                    ThemeUtil.PrimaryColor
                  ]
              )
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Image(
                    image: AssetImage("assets/scan/leaf-left-top.png"),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Image(
                  image: AssetImage("assets/scan/leaf-left-bottom.png"),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage("assets/scan/leaf-right-top.png"),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage("assets/scan/leaf-right-bottom.png"),
                ),
              ),
              Container(
                child: Image(
                    image: AssetImage("assets/scan/center-shape.png"),
                    width: screenSize.width,
                    height: screenSize.height,
                    fit: BoxFit.fill
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/scan/sample-image.png"),
                          ),
                        ),
                        Container(
                          child: Image(
                            image: AssetImage("assets/scan/camera-frame.png"),
                          ),
                        ),
                        cameraPreview(),
                        /*Container(
                          padding: EdgeInsets.only(top:150),
                          child: Image(
                            image: AssetImage("assets/scan/camera-overlay.png"),
                          ),
                        ),*/

                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 330, left: 100, right:100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/flush.png"),width: 48, height: 48,
                    ),
                    Image(
                      image: AssetImage("assets/icons/camera-rotate.png"),width: 48, height: 48,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 100),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/icons/zoom-slider-back.png"),
                        height: 230, width: 48,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 200),
                      child: Image(
                        image: AssetImage("assets/icons/zoom-out.png"),
                        height: 48, width: 48,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 100),
                      child: Image(
                        image: AssetImage("assets/icons/zoom-slider-nob.png"),
                        height: 48, width: 48,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/icons/zoom-in.png"),
                        width: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image(
                        image: AssetImage("assets/icons/home.png"),
                        width: 72,
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      child: Image(
                        image: AssetImage("assets/icons/scan.png"),
                        width: 64,
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx)=> ScanResultScreen())
                        );
                      },
                    ),
                    GestureDetector(
                      child: Image(
                        image: AssetImage("assets/icons/my-plants.png"),
                        width: 72,
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx)=> MyPlantsScreen())
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}