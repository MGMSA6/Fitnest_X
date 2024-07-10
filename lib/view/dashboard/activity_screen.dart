import 'package:fitnest_x/view/onboarding/welcome_screen.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/DayInfo.dart';
import '../../model/LatestWorkOut.dart';
import '../../res/components/VerticalProgressBar.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  late final List<DayInfo> daysInfo = generateDayInfo();

  final List<LatestWorkOut> latestWorkOut = LatestWorkOut.getDummyData();

  static late String selectedValue = "Daily";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(20),
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
                  color: const Color(0xFFF7F8F8),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: const Icon(Icons.more_horiz),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
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
                    const Text(
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
                          child: const Icon(
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
                      padding: const EdgeInsets.all(10),
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
                                gradient: AppColor.bluetextGradient,
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
                      padding: const EdgeInsets.all(10),
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
                                gradient: AppColor.bluetextGradient,
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
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Activity Progress',
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
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white, // Set the arrow color to white
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        // Update selected value and rebuild the widget
                        selectedValue = newValue!;
                      });
                    },
                    items: const [
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
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x111D1617),
                    blurRadius: 40,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: daysInfo
                  .map((day) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 135,
                            width: 22,
                            child: VerticalProgressBar(
                              progress: day.progress,
                              // Set your progress value here
                              startColor: day.startColor,
                              endColor: day.endColor,
                            ),
                          ),
                          Text(
                            day.text,
                            style: const TextStyle(
                              color: Color(0xFF7B6F72),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Activity',
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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3, // Number of items in the list
            itemBuilder: (BuildContext context, int index) {
              // Each item is a container with a box shadow
              LatestWorkOut workOut = latestWorkOut[index];
              return Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: index.isEven
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                            BoxShadow(
                              color: Color(0x0C1D242A),
                              blurRadius: 40,
                              offset: Offset(0, 10),
                              spreadRadius: 0, // changes position of shadow
                            ),
                          ])
                    : BoxDecoration(
                        color: Colors.transparent,
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: workOut.gradient,
                          ),
                          child: SvgPicture.asset(workOut.img),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    const Icon(
                      Icons.more_vert,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          ),
        ],
      )),
    );
  }

  List<DayInfo> generateDayInfo() {
    return [
      DayInfo(
          text: 'Sun',
          startColor: Color(0xFF92A3FD),
          endColor: Color(0xFF9DCEFF),
          progress: 0.3),
      DayInfo(
          text: 'Mon',
          startColor: Color(0xFFC58BF2),
          endColor: Color(0xFFB3BFFD),
          progress: 0.7),
      DayInfo(
          text: 'Tue',
          startColor: Color(0xFF92A3FD),
          endColor: Color(0xFF9DCEFF),
          progress: 0.4),
      DayInfo(
          text: 'Wed',
          startColor: Color(0xFFC58BF2),
          endColor: Color(0xFFB3BFFD),
          progress: 0.5),
      DayInfo(
          text: 'Thu',
          startColor: Color(0xFF92A3FD),
          endColor: Color(0xFF9DCEFF),
          progress: 0.4),
      DayInfo(
          text: 'Fri',
          startColor: Color(0xFFC58BF2),
          endColor: Color(0xFFB3BFFD),
          progress: 0.3),
      DayInfo(
          text: 'Sat',
          startColor: Color(0xFF92A3FD),
          endColor: Color(0xFF9DCEFF),
          progress: 0.4),
    ];
  }
}
