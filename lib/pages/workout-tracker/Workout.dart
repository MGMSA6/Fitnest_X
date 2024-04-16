import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/ExercisesSet.dart';
import '../../model/FitnessGear.dart';
import '../../model/LatestWorkOut.dart';
import '../../model/TrainingTarget.dart';
import '../../model/WorkOutData.dart';
import '../../utils/GradientSwitch.dart';
import '../../utils/colors.dart';
import '../onboarding/Welcome.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  bool isHeartFilled = false;

  void toggleHeart() {
    setState(() {
      isHeartFilled = !isHeartFilled;
    });
  }

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
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: AppColor.workBg,
                          borderRadius: BorderRadius.circular(150)),
                      child: SvgPicture.asset(
                        "assets/images/onboard_2.svg",
                      ),
                    )
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.87, // Adjust as needed
              maxChildSize: 0.87,
              minChildSize: 0.45,
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
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
                            margin: const EdgeInsets.only(
                                top: 15, left: 20, right: 20),
                            width: double.infinity,
                            height: 57,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Fullbody Workout',
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      '11 Exercises | 32mins | 320 Calories Burn',
                                      style: TextStyle(
                                        color: AppColor.grayColor1,
                                        fontSize: 12,
                                        height: 0.12,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x111D1617),
                                          blurRadius: 40,
                                          offset: Offset(0, 10),
                                          spreadRadius: 0,
                                        )
                                      ]),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {
                                        toggleHeart();
                                      },
                                      child: Center(
                                        child: SvgPicture.asset(
                                          isHeartFilled
                                              ? "assets/images/fav.svg"
                                              : "assets/images/heart.svg",
                                          height: 20,
                                          width: 20,
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                gradient: AppColor.blueBg,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x111D1617),
                                    blurRadius: 40,
                                    offset: Offset(0, 10),
                                    spreadRadius: 0,
                                  )
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/calendar.svg",
                                          width: 22,
                                          height: 22,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Schedule Workout',
                                          style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          '5/27, 09:00 AM',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0.15,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/forward.svg",
                                          height: 16,
                                          width: 16,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                gradient: AppColor.pinkBg,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x111D1617),
                                    blurRadius: 40,
                                    offset: Offset(0, 10),
                                    spreadRadius: 0,
                                  )
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/swap.svg",
                                          width: 22,
                                          height: 22,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Difficulity',
                                          style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Beginner',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/forward.svg",
                                          height: 16,
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'You’ll Need',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '5 Items',
                                  style: TextStyle(
                                    color: Color(0xFFACA3A5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  FitnessGear.getFitnessGearData().length,
                              // ber of items in the list
                              itemBuilder: (BuildContext context, int index) {
                                // Each item is a container with a box shadow
                                FitnessGear fitnessGearOut =
                                    FitnessGear.getFitnessGearData()[index];

                                // Apply padding based on index to control spacing between items
                                EdgeInsets itemPadding = EdgeInsets.only(
                                  left: index == 0 ? 20 : 10,
                                  // Start padding for first item, 10 for others
                                  right: index ==
                                          FitnessGear.getFitnessGearData()
                                                  .length -
                                              1
                                      ? 20
                                      : 10, // End padding for last item, 10 for others
                                );
                                return Container(
                                  padding: itemPadding,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF7F8F8),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                            child: SvgPicture.asset(
                                                fitnessGearOut.imgPath)),
                                      ),
                                      Text(
                                        fitnessGearOut.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30), //
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Exercises',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '3 Sets',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFACA3A5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Add spacing
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            // ber of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              // Each item is a container with a box shadow
                              ExercisesSet sets =
                                  ExercisesSet.getSetData()[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Set 1',
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemCount: sets.exercises.length,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return Row(
                                            children: [
                                              ClipRRect(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  child: SvgPicture.asset(sets.exercises[index].imgPath)
                                              )
                                            ],
                                          );
                                        })
                                  ],
                                ),
                              );
                            },
                          ),
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
