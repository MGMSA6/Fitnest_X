import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.85,
              decoration: BoxDecoration(gradient: AppColor.buttonColors),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/images/fit_body.svg"),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.maxFinite,
                      height: 68,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColor.cameraBg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/images/flash.svg"),
                          Container(
                              padding: EdgeInsets.all(10),
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  gradient: AppColor.unitGradient,
                                  borderRadius: BorderRadius.circular(99)),
                              child: SvgPicture.asset(
                                  "assets/images/camera_white.svg")),
                          SvgPicture.asset("assets/images/camera.svg")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
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
                            color: Color(0xFFF7F8F8)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/fit_body.svg",
                                height: 55,
                              ),
                            ),
                          ),
                        ),
                      )
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
                            color: Color(0xFFF7F8F8)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/fit_body_2.svg",
                                  height: 55),
                            ),
                          ),
                        ),
                      )
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
                            color: Color(0xFFF7F8F8)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/fit_body_3.svg",
                                  height: 55),
                            ),
                          ),
                        ),
                      )
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
                            color: Color(0xFFF7F8F8)),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/fit_body_4.svg",
                                  height: 55),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
