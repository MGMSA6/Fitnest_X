import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/WorkOutData.dart';
import '../../model/sleep.dart';
import '../../res/components/CustomDatePickerTimeline.dart';
import '../../res/components/GradientSwitch.dart';
import '../dashboard/Profile.dart';

class SleepSchedule extends StatefulWidget {
  const SleepSchedule({super.key});

  @override
  State<SleepSchedule> createState() => _SleepScheduleState();
}

class _SleepScheduleState extends State<SleepSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF7F8F8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Sleep Schedule',
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFF7F8F8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {},
                              child: Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 140,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          gradient: AppColor.blueBg,
                          borderRadius: BorderRadius.circular(22)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Ideal Hours for Sleep',
                                    style: TextStyle(
                                      color: Color(0xFF1D1517),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '8',
                                          style: TextStyle(
                                            color: Color(0xFF92A3FD),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'hours',
                                          style: TextStyle(
                                            color: Color(0xFF92A3FD),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 30',
                                          style: TextStyle(
                                            color: Color(0xFF92A3FD),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'minutes',
                                          style: TextStyle(
                                            color: Color(0xFF92A3FD),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 95,
                                height: 35,
                                decoration: ShapeDecoration(
                                  gradient: AppColor.buttonColors,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(55),
                                    onTap: () {},
                                    child: const Center(
                                      child: Text(
                                        'Learn More',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SvgPicture.asset("assets/images/sleep.svg")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Your Schedule',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDatePickerTimeline(
                    onDateChange: (DateTime) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Sleep.getSleepData()
                          .length, // Number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        // Each item is a container with a box shadow
                        Sleep sleep = Sleep.getSleepData()[index];
                        return Container(
                          height: 80,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x111D1617),
                                  blurRadius: 40,
                                  offset: Offset(0, 10),
                                  spreadRadius: 0,
                                ),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    sleep.imgPath,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "${sleep.name}, ",
                                              style: TextStyle(
                                                color: Color(0xFF1D1517),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: sleep.time,
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'in ',
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '6',
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'hours ',
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '22',
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'minutes',
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  GradientSwitch(
                                    width: 44,
                                    height: 24,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   if (value) {
                                      //     CustomToast.showCustomToast(
                                      //         context, "ON", 10, 20);
                                      //   } else {
                                      //     CustomToast.showCustomToast(
                                      //         context, "OFF", 10, 20);
                                      //   }
                                      // });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 20),
                      width: double.maxFinite,
                      height: 102,
                      decoration: BoxDecoration(
                          gradient: AppColor.pinkBg,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'You will get ',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '8',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'hours ',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '10',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'minutes\nfor tonight',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Colors.greenAccent,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColor.secondaryColor),
                                value:
                                    0.6, // Set the progress value here (0.0 to 1.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Positioned(
                right: 20,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    gradient: AppColor.unitGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4CC58BF2),
                        blurRadius: 22,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.add_rounded, color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
