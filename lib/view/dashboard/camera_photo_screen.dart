import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../res/colors.dart';

class Camera_Photo extends StatefulWidget {
  const Camera_Photo({super.key});

  @override
  State<Camera_Photo> createState() => _Camera_PhotoState();
}

class _Camera_PhotoState extends State<Camera_Photo> {
  bool _isFlashOn = false;
  bool _isCameraOn = false;
  CameraController? controller;
  Future<void>? _initializeControllerFuture;
  String _imgPath = "assets/images/fit_body.svg";

  @override
  void initState() {
    super.initState();
    _isCameraOn = false; // Add this line
    _requestCameraPermission();
  }

  void _requestCameraPermission() async {
    await Permission.camera.request();
  }

  void _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.medium);
        _initializeControllerFuture = controller!.initialize().then((_) {
          setState(() {
            _isCameraOn = true;
          });
        });
      } else {
        print("No cameras found");
      }
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  void _toggleFlashlight() async {
    try {
      _isFlashOn = !_isFlashOn;
      await controller!
          .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  void _toggleCamera() {
    setState(() {
      if (_isCameraOn) {
        controller?.dispose();
        _isCameraOn = false;
      } else {
        _initializeCamera();
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _changeImage(String newPath) {
    setState(() {
      _imgPath = newPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            if (_isCameraOn)
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(controller!);
                  } else {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            else
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      if (_isCameraOn)
                        Positioned.fill(
                          child: FutureBuilder<void>(
                            future: _initializeControllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CameraPreview(controller!);
                              } else {
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      if (!_isCameraOn)
                        Container(
                          decoration: BoxDecoration(
                            gradient: AppColor.buttonColors,
                          ),
                        ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              _imgPath,
                              height: 489,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              width: double.maxFinite,
                              height: 68,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: AppColor.cameraBg.withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: _toggleFlashlight,
                                    child: SvgPicture.asset(
                                        "assets/images/flash.svg"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      gradient: AppColor.unitGradient,
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(99),
                                        onTap: _toggleCamera,
                                        child: SvgPicture.asset(
                                            "assets/images/camera_white.svg"),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/camera.svg"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: screenHeight * 0.15,
                        child: Row(
                          children: [
                            Container(
                              width: 67,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFF7F8F8),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _changeImage("assets/images/fit_body.svg");
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/fit_body.svg",
                                      height: 55,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.15,
                        child: Row(
                          children: [
                            Container(
                              width: 67,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFF7F8F8),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _changeImage(
                                        "assets/images/fit_body_2.svg");
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/images/fit_body_2.svg",
                                        height: 55),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.15,
                        child: Row(
                          children: [
                            Container(
                              width: 67,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFF7F8F8),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _changeImage(
                                        "assets/images/fit_body_3.svg");
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/images/fit_body_3.svg",
                                        height: 55),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.15,
                        child: Row(
                          children: [
                            Container(
                              width: 67,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFF7F8F8),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _changeImage(
                                        "assets/images/fit_body_4.svg");
                                  },
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/images/fit_body_4.svg",
                                        height: 55),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
