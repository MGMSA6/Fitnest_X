import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/FitnessGear.dart';
import '../../model/LatestWorkOut.dart';
import '../../model/Meals.dart';
import '../../model/WorkOutData.dart';
import '../../res/colors.dart';
import '../../res/components/custom_dropdown.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({super.key});

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  static late String selectedValue = "Daily";
  static late String selectedValue1 = "Breakfast";

  final List<LatestWorkOut> latestWorkOut = LatestWorkOut.getDummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      'Meal Planner',
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
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Meal Nutritions',
                        style: TextStyle(
                          color: Color(0xFF1D1517),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    CustomDropdown(
                      items: ["Daily", "Weekly", "Monthly", "Yearly"],
                      selectedValue: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 250,
                child: SfCartesianChart(
                  plotAreaBorderColor: Colors.transparent,
                  // Color of chart plot area border
                  primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(color: Colors.black),
                      majorGridLines: MajorGridLines(color: Colors.transparent),
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
                      yValueMapper: (WorkOutData sales, _) => sales.percentage,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Today Meals',
                        style: TextStyle(
                          color: Color(0xFF1D1517),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    CustomDropdown(
                      items: ["Breakfast", "Lunch", "Dinner"],
                      selectedValue: selectedValue1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue1 = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2, // Number of items in the list
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/glass_of_milk.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Salmon Nigiri",
                                    style: const TextStyle(
                                      color: Color(0xFF1D1517),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Today | 7am",
                                    style: const TextStyle(
                                      color: Color(0xFF7B6F72),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset("assets/images/un_reminder.svg")
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Find Something to Eat',
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
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Meals.getMealsData().length,
                  // ber of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    // Each item is a container with a box shadow
                    Meals mealsData = Meals.getMealsData()[index];

                    // Apply padding based on index to control spacing between items
                    EdgeInsets itemPadding = EdgeInsets.only(
                      left: index == 0 ? 20 : 10,
                      // Start padding for first item, 10 for others
                      right:
                          index == FitnessGear.getFitnessGearData().length - 1
                              ? 20
                              : 10, // End padding for last item, 10 for others
                    );
                    return Container(
                      padding: itemPadding,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: AppColor.blueBg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(22),
                            bottomRight: Radius.circular(22),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(
                                mealsData.imgPath,
                                width: 118,
                                height: 74,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mealsData.name,
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      mealsData.deatils,
                                      style: TextStyle(
                                        color: Color(0xFF7B6F72),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: 98,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        gradient: AppColor.buttonColors,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          onTap: () {},
                                          child: const Center(
                                            child: Text(
                                              'Select',
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
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
