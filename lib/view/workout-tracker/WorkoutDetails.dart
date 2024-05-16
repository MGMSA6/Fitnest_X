import 'package:fitnest_x/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/CustomRepetition.dart';
import '../../res/components/CustomPickerItem.dart';
import '../../res/components/ReadMoreWidget.dart';
import '../../res/components/TimelineItem1.dart';
import '../../res/colors.dart';
import '../../utils/routes/route_names.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  final List<CustomRepetition> items = CustomRepetition.getCustomRepetition();

  int _selectedItem = 0;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    height: 80,
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
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
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
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SvgPicture.asset("assets/images/video_section.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jumping Jack',
                              style: TextStyle(
                                color: Color(0xFF1D1517),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Easy | 390 Calories Burn',
                              style: TextStyle(
                                color: Color(0xFF7B6F72),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Descriptions',
                              style: TextStyle(
                                color: Color(0xFF1D1517),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 0.09,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ReadMoreWidget(
                              initialText: AppString.initialText,
                              remainingText: AppString.remainingText,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'How To Do It',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '4 Steps',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFACA3A5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 20, right: 20, bottom: 20),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return CustomPaint(
                                    size: Size(0, 300),
                                    painter: TimelineItem(
                                      numberOfIndicators: 4,
                                      indicatorRadius: 1,
                                      indicatorSpacing: 80,
                                      indicatorData: [
                                        IndicatorData(
                                            text1: 'Spread Your Arms',
                                            text2:
                                                'To make the gestures feel more relaxed, \nstretch your arms as you start this \nmovement. No bending of hands.',
                                            count: 1),
                                        IndicatorData(
                                            text1: 'Rest at The Toe',
                                            text2:
                                                'The basis of this movement is jumping.\nNow, what needs to be considered is that\nyou have to use the tips of your feet',
                                            count: 2),
                                        IndicatorData(
                                            text1: 'Adjust Foot Movement',
                                            text2:
                                                'Jumping Jack is not just an ordinary\njump. But, you also have to pay close\nattention to leg movements.',
                                            count: 3),
                                        IndicatorData(
                                            text1: 'Clapping Both Hands',
                                            text2:
                                                'This cannot be taken lightly. You see,\nwithout realizing it, the clapping of your\nhands helps you to keep your rhythm\nwhile doing the Jumping Jack',
                                            count: 4),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Custom Repetitions',
                              style: TextStyle(
                                color: Color(0xFF1D1517),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: CustomPickerItem(),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
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
                      borderRadius: BorderRadius.circular(99),
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.workoutSchedule);
                      },
                      child: const SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Save",
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
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
