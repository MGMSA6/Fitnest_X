import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/LatestWorkOut.dart';
import '../../model/WorkOutData.dart';
import '../../model/result_set.dart';
import '../../res/components/tab_screen.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
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
                        dataSource: WorkOutData.getWorkOutData1(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'May',
                      style: TextStyle(
                        color: Color(0xFF7B6F72),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'June',
                      style: TextStyle(
                        color: Color(0xFF7B6F72),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Lose Weight',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '33%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 243,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: AppColor.brandColors,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Opacity(
                              opacity: 0.30,
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFFF0000),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColor.secondaryColor),
                                value:
                                    0.2, // Set the progress value here (0.0 to 1.0)
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '67%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Height Increase',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '88%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 243,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: AppColor.brandColors,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Opacity(
                              opacity: 0.30,
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFFF0000),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColor.secondaryColor),
                                value:
                                    0.8, // Set the progress value here (0.0 to 1.0)
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '12%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Muscle Mass Increase',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '57%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 243,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: AppColor.brandColors,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Opacity(
                              opacity: 0.30,
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFFF0000),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColor.secondaryColor),
                                value:
                                    0.57, // Set the progress value here (0.0 to 1.0)
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '43%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Abs',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '89%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 243,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: AppColor.brandColors,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Opacity(
                              opacity: 0.30,
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFF7B6F72),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColor.secondaryColor),
                                value:
                                    0.89, // Set the progress value here (0.0 to 1.0)
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '11%',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppColor.buttonColors,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(
                            0, 4), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: const SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Back to Home",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
