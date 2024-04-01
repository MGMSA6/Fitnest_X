import 'package:fitnest_x/pages/onboarding/Welcome.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<WorkOutData> getWorkOutData() {
    final List<WorkOutData> workOutData = [
      WorkOutData("Sun", 30),
      WorkOutData("Mon", 50),
      WorkOutData("Tue", 70),
      WorkOutData("Wen", 60),
      WorkOutData("Thu", 80),
      WorkOutData("Fri", 90),
      WorkOutData("Sat", 85),
    ];

    return workOutData;
  }

  static late String selectedValue = "Daily";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Text(
                'Activity Tracker',
                style: TextStyle(
                  color: Color(0xFF1D1517),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
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
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: AppColor.blueBg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today Target',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: AppColor.buttonColors),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {},
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 130,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/glass.svg"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientText(
                                text: "8L",
                                gradient: LinearGradient(
                                  begin: Alignment(-1.00, 0.08),
                                  end: Alignment(1, -0.08),
                                  colors: [
                                    Color(0xFF92A3FD),
                                    Color(0xFF9DCEFF)
                                  ],
                                ),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Water Intake',
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
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 130,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/boots.svg"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GradientText(
                                text: "2400",
                                gradient: LinearGradient(
                                  begin: Alignment(-1.00, 0.08),
                                  end: Alignment(1, -0.08),
                                  colors: [
                                    Color(0xFF92A3FD),
                                    Color(0xFF9DCEFF)
                                  ],
                                ),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Foot Steps',
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
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Activity Progress',
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
                      color: Colors.white, // Set the arrow color to white
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
                            color: Colors.white, // Change the color of the text
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
                            color: Colors.white, // Change the color of the text
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
                            color: Colors.white, // Change the color of the text
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
        ],
      )),
    );
  }
}

class WorkOutData {
  final String weekDay;
  final int percentage;

  WorkOutData(this.weekDay, this.percentage);
}
