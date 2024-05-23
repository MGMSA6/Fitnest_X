import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/WorkOutData.dart';
import '../../model/sleep.dart';
import '../../res/components/GradientSwitch.dart';
import '../dashboard/Profile.dart';

class SleepTrack extends StatefulWidget {
  const SleepTrack({super.key});

  @override
  State<SleepTrack> createState() => _SleepTrackState();
}

class _SleepTrackState extends State<SleepTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      'Sleep Tracker',
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: SfCartesianChart(
                    plotAreaBorderColor: Colors.transparent,
                    // Color of chart plot area border
                    primaryXAxis: const CategoryAxis(
                        labelStyle: TextStyle(color: Colors.black),
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent),
                        axisLine: AxisLine(width: 0)),
                    primaryYAxis: NumericAxis(
                      labelStyle: const TextStyle(color: Colors.black),
                      // Set the format of labels to include a '%' symbol at the end.
                      labelFormat: '{value}%',
                      majorGridLines: MajorGridLines(color: Color(0xFFACA3A5)),
                      axisLine: const AxisLine(width: 0),
                    ),
                    series: <CartesianSeries>[
                      SplineSeries<WorkOutData, String>(
                        dataSource: WorkOutData.getWorkOutData(),
                        xValueMapper: (WorkOutData sales, _) => sales.weekDay,
                        yValueMapper: (WorkOutData sales, _) =>
                            sales.percentage,
                        color: Colors.blue,
                        //
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(color: Colors.black),
                            borderColor: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 148,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: AppColor.buttonColors,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x4C95ADFE),
                          blurRadius: 22,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Night Sleep',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '8',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'h',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '20',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'm',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset("assets/images/sleep_graph.svg")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 57,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: AppColor.blueBg),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daily Sleep Schedule',
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: 68,
                          height: 28,
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
                              onTap: () {
                                Navigator.pushNamed(context, RouteNames.sleepSchedule);
                              },
                              child: const Center(
                                child: Text(
                                  'Check',
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
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Today Schedule',
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListView.builder(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
