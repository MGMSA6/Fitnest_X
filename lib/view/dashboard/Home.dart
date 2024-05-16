import 'dart:developer';
import 'dart:math';

import 'package:fitnest_x/view/dashboard/Activity.dart';
import 'package:fitnest_x/view/onboarding/Notifications.dart';
import 'package:fitnest_x/view/onboarding/Welcome.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/LatestWorkOut.dart';
import '../../model/WorkOutData.dart';
import '../../res/components/CircularGradientProgressBar.dart';
import '../../res/components/TimelineItem.dart';
import '../../res/components/VerticalProgressBar.dart';
import '../../utils/routes/route_names.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData("", 80, Colors.white),
      ChartData("20,1", 20, Colors.pinkAccent),
    ];
    return chartData;
  }

  List<LineData> getLineData() {
    final List<LineData> lineData = [
      LineData(2010, 0, const Color(0xff92A3FD)),
      LineData(2011, 30, const Color(0xff92A3FD)),
      LineData(2012, 40, const Color(0xff92A3FD)),
      LineData(2013, 20, const Color(0xff92A3FD)),
      LineData(2014, 100, const Color(0xff92A3FD)),
      LineData(2015, 190, const Color(0xff92A3FD)),
      LineData(2016, 200, const Color(0xff92A3FD)),
      LineData(2017, 50, const Color(0xff92A3FD)),
    ];
    return lineData;
  }

  final List<LatestWorkOut> latestWorkOut = LatestWorkOut.getDummyData();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Daily"), value: "Daily"),
      DropdownMenuItem(child: Text("Weekly"), value: "Weekly"),
      DropdownMenuItem(child: Text("Monthly"), value: "Monthly"),
      DropdownMenuItem(child: Text("Yearly"), value: "Yearly"),
    ];
    return menuItems;
  }

  static late String selectedValue = "Daily";

  List<StaggeredGridTile> getItems() {
    List<StaggeredGridTile> items = [
      StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x0C1D242A),
                blurRadius: 40,
                offset: Offset(0, 10),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 5),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalProgressBar(
                    progress: 0.6,
                    startColor: Color(0xFFC58BF2),
                    endColor: Color(0xFFB3BFFD),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Water Intake',
                        style: TextStyle(
                          color: Color(0xFF1C242A),
                          height: 1.5,
                          fontSize: 12,
                        ),
                      ),
                      GradientText(
                        text: "4 Liters",
                        gradient: AppColor.bluetextGradient,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            height: 2),
                      ),
                      const Text(
                        'Real time updates',
                        style: TextStyle(
                          color: Color(0xFF7B6F72),
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Flexible(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomPaint(
                                size: const Size(1, 90),
                                painter: TimelineItem(
                                  numberOfIndicators: 5,
                                  indicatorRadius: 1,
                                  indicatorSpacing: 40,
                                  indicatorData: [
                                    IndicatorData(
                                        text1: '6am - 8am', text2: '600ml'),
                                    IndicatorData(
                                        text1: '9am - 11am', text2: '500ml'),
                                    IndicatorData(
                                        text1: '11am - 2pm', text2: '1000ml'),
                                    IndicatorData(
                                        text1: '2pm - 4pm', text2: '700ml'),
                                    IndicatorData(
                                        text1: '4pm - now', text2: '900ml'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
                color: Color(0x0C1D242A),
                blurRadius: 40,
                offset: Offset(0, 10),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sleep',
                  style: TextStyle(
                    color: Color(0xFF1C242A),
                    fontSize: 12,
                    height: 0.12,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GradientText(
                  text: "8h 20m",
                  gradient: AppColor.bluetextGradient,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  child: SvgPicture.asset(
                    "assets/images/sleepgraph.svg",
                  ),
                )
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
                color: Color(0x0C1D242A),
                blurRadius: 40,
                offset: Offset(0, 10),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Calories',
                  style: TextStyle(
                    color: Color(0xFF1C242A),
                    fontSize: 12,
                    height: 0.12,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GradientText(
                  text: "760 kCal",
                  gradient: AppColor.bluetextGradient,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              child: CircularGradientProgressBar(
                                strokeWidth: 8,
                                value: 0.7,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFC58BF2),
                                    Color(0xFFB3BFFD)
                                  ],
                                ),
                                unfilledColor: const Color(0xFFF7F8F8),
                                radius: 35,
                                child: SizedBox(),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 48, // Adjust size as needed
                              width: 48, // Adjust size as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF92A3FD),
                                    Color(0xFF9DCEFF)
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '230kCal\nleft',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
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
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: AppColor.notification,
                      ),
                      child: Material(
                        color: Colors.transparent, // Add this line
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.notification,
                            );
                          },
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
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "You have a normal weight",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                const SizedBox(
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
                                        child: const Center(
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
                SizedBox(
                  width: double.infinity,
                  height: 57,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 57,
                        decoration: ShapeDecoration(
                          gradient: AppColor.blueBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Center(
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
                                gradient: const LinearGradient(
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
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteNames.activity,
                                    );
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Activity Status',
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.maxFinite,
                  height: 150,
                  decoration: ShapeDecoration(
                    gradient: AppColor.blueBg,
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
                      Flexible(
                          child: SfCartesianChart(series: <CartesianSeries>[
                        // Renders line chart
                        LineSeries<LineData, int>(
                            dataSource: getLineData(),
                            pointColorMapper: (LineData data, _) => data.color,
                            xValueMapper: (LineData data, _) => data.x,
                            yValueMapper: (LineData data, _) => data.y)
                      ]))
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Workout Progress',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                            )),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99.0),
                            // Adjust the radius as needed
                            gradient: AppColor.buttonColors,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              value: selectedValue,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors
                                    .white, // Set the arrow color to white
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  // Update selected value and rebuild the widget
                                  selectedValue = newValue!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 'Daily',
                                  child: Text(
                                    'Daily',
                                    style: TextStyle(
                                      fontSize: 12,
                                      // Adjust the font size as needed
                                      color: Colors
                                          .white, // Change the color of the text
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Weekly',
                                  child: Text(
                                    'Weekly',
                                    style: TextStyle(
                                      fontSize: 12,
                                      // Adjust the font size as needed
                                      color: Colors
                                          .white, // Change the color of the text
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Monthly',
                                  child: Text(
                                    'Monthly',
                                    style: TextStyle(
                                      fontSize: 12,
                                      // Adjust the font size as needed
                                      color: Colors
                                          .white, // Change the color of the text
                                    ),
                                  ),
                                ),
                              ],
                              dropdownColor: Colors
                                  .black, // Ensure dropdown menu background is transparent
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                          // Set the format of labels to include a '%' symbol at the end.
                          labelFormat: '{value}%',
                        ),
                        series: <CartesianSeries>[
                          SplineSeries<WorkOutData, String>(
                            dataSource: WorkOutData.getWorkOutData(),
                            xValueMapper: (WorkOutData sales, _) =>
                                sales.weekDay,
                            yValueMapper: (WorkOutData sales, _) =>
                                sales.percentage,
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
                        Text('Latest Workout',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        Text('See more',
                            style: TextStyle(
                              color: Color(0xFFACA3A5),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3, // Number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        // Each item is a container with a box shadow
                        LatestWorkOut workOut = latestWorkOut[index];
                        return Container(
                          height: 80,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0C1D242A),
                                blurRadius: 40,
                                offset: Offset(0, 10),
                                spreadRadius: 0, // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: workOut.gradient,
                                ),
                                child: SvgPicture.asset(workOut.img),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    workOut.title,
                                    style: const TextStyle(
                                      color: Color(0xFF1D1517),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    workOut.description,
                                    style: const TextStyle(
                                      color: Color(0xFFA3A8AC),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    width: 180,
                                    height: 10,
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
                                        backgroundColor: Colors.grey[200],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColor.secondaryColor),
                                        value:
                                            0.6, // Set the progress value here (0.0 to 1.0)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                "assets/images/workout_btn.svg",
                              )
                            ],
                          ),
                        );
                      },
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
