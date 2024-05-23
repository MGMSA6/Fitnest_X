import 'package:calendar_view/calendar_view.dart';
import 'package:fitnest_x/model/MealSet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/ExerciseSet.dart';
import '../../model/Meals.dart';
import '../../res/components/CustomDatePickerTimeline.dart';
import '../../res/colors.dart';
import '../../utils/routes/route_names.dart';

class MealSchedule extends StatefulWidget {
  const MealSchedule({super.key});

  @override
  State<MealSchedule> createState() => _MealScheduleState();
}

class _MealScheduleState extends State<MealSchedule> {
  bool isHeartFilled = false;
  final DateTime _selectedDate = DateTime.now();

  final List<CalendarEventData> _events = [
    // Add today's 8 PM event
    CalendarEventData(
      date: DateTime.now(),
      title: "New Event",
      // Replace with your desired title
      description: "This is a new event for today.",
      startTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        10, // Set hour to 8 PM
        0, // Set minute to 0
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        11, // Set end time if needed (optional)
        0, // Set minute to 0 (optional)
      ),
    ),
    // ... your existing events (optional)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                              'Meal Schedule',
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
                        height: 20,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("assets/images/arrow_left.svg"),
                            Text(
                              'May 2021',
                              style: TextStyle(
                                color: Color(0xFFACA3A5),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SvgPicture.asset("assets/images/icon_arrow.svg"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDatePickerTimeline(
                        onDateChange: (DateTime) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: MealSet.getMealSetData().length,
                        // ber of items in the list
                        itemBuilder: (BuildContext context, int index) {
                          // Each item is a container with a box shadow
                          MealSet mealSet = MealSet.getMealSetData()[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      mealSet.mealType,
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      mealSet.calories,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFFACA3A5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: mealSet.meals.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                  gradient: index.isEven
                                                      ? AppColor.blueBg
                                                      : AppColor.pinkBg,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: SvgPicture.asset(
                                                mealSet.meals[index].imgPath,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  mealSet.meals[index].name,
                                                  style: TextStyle(
                                                    color: Color(0xFF1D1517),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  mealSet.meals[index].details,
                                                  style: TextStyle(
                                                    color: Color(0xFF7B6F72),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SvgPicture.asset(
                                            "assets/images/icon_next.svg")
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Today Meal Nutritions',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Meals.getTodayMeal()
                              .length, // Number of items in the list
                          itemBuilder: (BuildContext context, int index) {
                            // Each item is a container with a box shadow
                            Meals meals = Meals.getTodayMeal()[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 80,
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: index.isEven
                                  ? BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.0),
                                      boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x111D1617),
                                            blurRadius: 40,
                                            offset: Offset(0, 10),
                                            spreadRadius: 0,
                                          ),
                                        ])
                                  : BoxDecoration(color: Colors.transparent),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            meals.name,
                                            style: TextStyle(
                                              color: Color(0xFF1D1517),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SvgPicture.asset(meals.imgPath)
                                        ],
                                      ),
                                      Text(
                                        meals.details,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Color(0xFF7B6F72),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              gradient: AppColor.loaderBg,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: const SizedBox(
                                            width: double.maxFinite,
                                            height: 10,
                                            child: LinearProgressIndicator(
                                              value: 0.1,
                                              backgroundColor:
                                                  Colors.transparent,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.transparent),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: AppColor.unitGradient,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4CC58BF2),
                      blurRadius: 22,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.add_rounded, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
