import 'dart:developer';
import 'package:fitnest_x/pages/Welcome.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/TimelineIndicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData("", 80, Colors.white),
      ChartData("20,1", 20, Colors.pinkAccent),
    ];
    return chartData;
  }

  List<LineData> getLineData() {
    final List<LineData> lineData = [
      LineData(2010, 0, Color(0xff92A3FD)),
      LineData(2011, 1000, Color(0xff92A3FD)),
      LineData(2012, 500, Color(0xff92A3FD)),
      LineData(2013, 1000, Color(0xff92A3FD)),
      LineData(2014, 2000, Color(0xff92A3FD)),
      LineData(2015, 5000, Color(0xff92A3FD)),
      LineData(2016, 6000, Color(0xff92A3FD)),
      LineData(2017, 1500, Color(0xff92A3FD)),
      LineData(2018, 8000, Color(0xff92A3FD)),
    ];
    return lineData;
  }

  List<StaggeredGridTile> getItems() {
    List<StaggeredGridTile> items = [
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 4,
        child: Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE8E8E8).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 15, bottom: 20, left: 15),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Container(
                      height: double.infinity,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        gradient: LinearGradient(
                          colors: [Color(0xFFC58BF2), Color(0xFFB3BFFD)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Water Intake',
                          style: TextStyle(
                            color: Color(0xFF1C242A),
                            fontSize: 12,
                            height: 0.12,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GradientText(
                          text: "4 Liters",
                          gradient: LinearGradient(
                            begin: Alignment(-1.00, 0.08),
                            end: Alignment(1, -0.08),
                            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Real time updates',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 10,
                            height: 0.15,
                          ),
                        ),
                        Flexible(
                          child: TimelineIndicator(
                            lineGap: 10,
                            itemGap: 30,
                            indicators: <Widget>[
                              Container(
                                width: 1,
                                height: 1,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.00, 0.08),
                                    end: Alignment(1, -0.08),
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFEEA4CE)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.00, 0.08),
                                    end: Alignment(1, -0.08),
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFEEA4CE)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.00, 0.08),
                                    end: Alignment(1, -0.08),
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFEEA4CE)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.00, 0.08),
                                    end: Alignment(1, -0.08),
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFEEA4CE)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.00, 0.08),
                                    end: Alignment(1, -0.08),
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFEEA4CE)
                                    ],
                                  ),
                                ),
                              )
                            ],
                            children: const <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6am - 8am',
                                    style: TextStyle(
                                      color: Color(0xFFACA3A5),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '600ml',
                                    style: TextStyle(
                                      color: Color(0xFFC58BF2),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.19,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6am - 8am',
                                    style: TextStyle(
                                      color: Color(0xFFACA3A5),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '600ml',
                                    style: TextStyle(
                                      color: Color(0xFFC58BF2),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.19,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6am - 8am',
                                    style: TextStyle(
                                      color: Color(0xFFACA3A5),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '600ml',
                                    style: TextStyle(
                                      color: Color(0xFFC58BF2),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.19,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6am - 8am',
                                    style: TextStyle(
                                      color: Color(0xFFACA3A5),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '600ml',
                                    style: TextStyle(
                                      color: Color(0xFFC58BF2),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.19,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6am - 8am',
                                    style: TextStyle(
                                      color: Color(0xFFACA3A5),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '600ml',
                                    style: TextStyle(
                                      color: Color(0xFFC58BF2),
                                      fontSize: 8,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.19,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2, // Each of the two tiles will span one column
        mainAxisCellCount: 2, // Each of the two tiles will span two rows
        child: Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE8E8E8).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sleep',
                  style: TextStyle(
                    color: Color(0xFF1C242A),
                    fontSize: 12,
                    height: 0.12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GradientText(
                  text: "8h 20m",
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.08),
                    end: Alignment(1, -0.08),
                    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE8E8E8).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories',
                  style: TextStyle(
                    color: Color(0xFF1C242A),
                    fontSize: 12,
                    height: 0.12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GradientText(
                  text: "760 kCal",
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.08),
                    end: Alignment(1, -0.08),
                    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(
                              fontSize: 14, color: AppColor.grayColor2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Stefani Wong,",
                          style: TextStyle(
                              fontSize: 22,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Material(
                      type: MaterialType.transparency, // Add this line
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: AppColor.notification,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                                "assets/images/notification.svg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: AppColor.buttonColors,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            'assets/images/banner_dots.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "BMI (Body Mass Index)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "You have a normal weight",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    height: 35,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(99),
                                        gradient: AppColor.unitGradient),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(99),
                                        onTap: () {},
                                        child: Center(
                                          child: Text(
                                            "View More",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            Flexible(
                              child: SfCircularChart(series: <CircularSeries>[
                                PieSeries<ChartData, String>(
                                    dataSource: getChartData(),
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true),
                                    dataLabelMapper: (ChartData data, _) =>
                                        data.x,
                                    explode: true,
                                    explodeIndex: 1)
                              ]),
                            ),
                          ],
                        )
                      ],
                    )),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 57,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.20,
                        child: Container(
                          width: double.infinity,
                          height: 57,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-1.00, 0.08),
                              end: Alignment(1, -0.08),
                              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                'Today Target',
                                style: TextStyle(
                                  color: Color(0xFF1D1517),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 28,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(-1.00, 0.08),
                                  end: Alignment(1, -0.08),
                                  colors: [
                                    Color(0xFF9DCEFF),
                                    Color(0xFF92A3FD)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(55),
                                  onTap: () {},
                                  child: Center(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Activity Status',
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.maxFinite,
                  height: 150,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.00, 0.08),
                      end: Alignment(1, -0.08),
                      colors: [
                        Color(0xFF92A3FD).withOpacity(0.20),
                        Color(0xFF9DCEFF).withOpacity(0.20)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        // Add bottom padding
                        child: Text(
                          "Heart Rate",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Add bottom padding
                        child: GradientText(
                          text: "78 BPM",
                          gradient: LinearGradient(
                            begin: Alignment(-1.00, 0.08),
                            end: Alignment(1, -0.08),
                            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          child: Flexible(
                              child: SfCartesianChart(series: <CartesianSeries>[
                        // Renders line chart
                        LineSeries<LineData, int>(
                            dataSource: getLineData(),
                            pointColorMapper: (LineData data, _) => data.color,
                            xValueMapper: (LineData data, _) => data.x,
                            yValueMapper: (LineData data, _) => data.y)
                      ])))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: getItems(),
                ),
                const SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Workout Progress',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}

class LineData {
  LineData(this.x, this.y, [this.color]);

  final int x;
  final double y;
  final Color? color;
}
