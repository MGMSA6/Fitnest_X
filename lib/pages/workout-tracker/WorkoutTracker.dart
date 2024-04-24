import 'package:fitnest_x/pages/workout-tracker/Workout.dart';
import 'package:fitnest_x/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/LatestWorkOut.dart';
import '../../model/TrainingTarget.dart';
import '../../model/WorkOutData.dart';
import '../../utils/GradientSwitch.dart';
import '../../utils/colors.dart';
import '../onboarding/Welcome.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({super.key});

  @override
  State<WorkoutTracker> createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(gradient: AppColor.buttonColors),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Workout Tracker',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            height: 0.09,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: SfCartesianChart(
                        plotAreaBorderColor: Colors.transparent,
                        // Color of chart plot area border
                        primaryXAxis: const CategoryAxis(
                            labelStyle: TextStyle(color: Colors.white),
                            majorGridLines:
                                MajorGridLines(color: Colors.transparent),
                            axisLine: AxisLine(width: 0)),
                        primaryYAxis: NumericAxis(
                          labelStyle: const TextStyle(color: Colors.white),
                          // Set the format of labels to include a '%' symbol at the end.
                          labelFormat: '{value}%',
                          majorGridLines:
                              MajorGridLines(color: AppColor.whiteBg),
                          axisLine: const AxisLine(width: 0),
                        ),
                        series: <CartesianSeries>[
                          SplineSeries<WorkOutData, String>(
                            dataSource: WorkOutData.getWorkOutData(),
                            xValueMapper: (WorkOutData sales, _) =>
                                sales.weekDay,
                            yValueMapper: (WorkOutData sales, _) =>
                                sales.percentage,
                            color: Colors.white,
                            //
                            dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                                textStyle: TextStyle(color: Colors.white),
                                borderColor: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.87, // Adjust as needed
              maxChildSize: 0.87,
              minChildSize: 0.52,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x111D1617),
                          blurRadius: 40,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        )
                      ]),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    controller: scrollController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 57,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: AppColor.blueBg),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Daily Workout Schedule',
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
                                      onTap: () {},
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
                          SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Upcoming Workout',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text('See more',
                                  style: TextStyle(
                                    color: Color(0xFFACA3A5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            // Num
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  height: 20); // Add space between items
                            },
                            // ber of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              // Each item is a container with a box shadow
                              LatestWorkOut workOut =
                                  LatestWorkOut.getDummyData()[index];
                              return Container(
                                height: 80,
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x0C1D242A),
                                      blurRadius: 40,
                                      offset: Offset(0, 10),
                                      spreadRadius:
                                          0, // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          height: 50,
                                          width: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: workOut.gradient,
                                          ),
                                          child: SvgPicture.asset(workOut.img),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                          ],
                                        ),
                                      ],
                                    ),
                                    GradientSwitch(
                                      height: 20,
                                      width: 38,
                                      paddingFactor: 0.2,
                                      onChanged: (value) {
                                        setState(() {
                                          // if (value) {
                                          //   CustomToast.showCustomToast(
                                          //       context, "ON", 10, 20);
                                          // } else {
                                          //   CustomToast.showCustomToast(
                                          //       context, "OFF", 10, 20);
                                          // }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40), //
                          const Text(
                            'What Do You Want to Train',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                            ),
                          ),

                          /// Add spacing
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            // Num
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  height: 20); // Add space between items
                            },
                            // ber of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              // Each item is a container with a box shadow
                              TrainingTarget trainData =
                                  TrainingTarget.getDummyData()[index];
                              return Container(
                                padding: const EdgeInsets.all(20),
                                height: 132,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: AppColor.blueBg),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              trainData.title,
                                              style: TextStyle(
                                                color: Color(0xFF1D1517),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              trainData.description,
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 35,
                                          width: 95,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Workout(
                                                              trainingTarget:
                                                                  trainData,
                                                            )));
                                              },
                                              child: Center(
                                                child: GradientText(
                                                  text: AppString.viewMore,
                                                  gradient:
                                                      AppColor.bluetextGradient,
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 92,
                                      height: 92,
                                      decoration: BoxDecoration(
                                          color: AppColor.whiteBg,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child:
                                          SvgPicture.asset(trainData.imagePath),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
