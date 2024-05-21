import 'package:fitnest_x/model/Meals.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:fitnest_x/view/onboarding/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/ExercisesSet.dart';
import '../../model/FitnessGear.dart';
import '../../res/colors.dart';
import '../../res/components/ReadMoreWidget.dart';
import '../../res/strings.dart';

class MealDetails extends StatefulWidget {
  final Meals meals;

  MealDetails({super.key, required this.meals});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
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
                    Stack(children: [
                      Center(
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              color: AppColor.workBg,
                              borderRadius: BorderRadius.circular(150)),
                        ),
                      ),
                      SvgPicture.asset(
                        widget.meals.imgPath,
                        height: 250,
                        width: 250,
                      ),
                    ])
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.meals.name,
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "by",
                                          style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        GradientText(
                                          text: " James Ruth",
                                          gradient: AppColor.bluetextGradient,
                                          style: TextStyle(
                                            color: AppColor.grayColor1,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
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
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                              'Nutrition',
                              style: TextStyle(
                                color: Color(0xFF1D1517),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Meals.getNutrition().length,
                              // ber of items in the list
                              itemBuilder: (BuildContext context, int index) {
                                // Each item is a container with a box shadow
                                Meals meals = Meals.getNutrition()[index];
                                return Container(
                                  padding: index == 0
                                      ? EdgeInsets.only(left: 20)
                                      : EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 38,
                                        decoration: BoxDecoration(
                                          gradient: AppColor.blueBg,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SvgPicture.asset(
                                              meals.imgPath,
                                              width: 18,
                                              height: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              meals.details,
                                              style: TextStyle(
                                                color: Color(0xFF1D1517),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                  initialText: AppString.mealInitialText,
                                  remainingText: AppString.mealRemainingText,
                                ),
                              ],
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
                                const Text(
                                  'Ingredients That You \nWill Need',
                                  style: TextStyle(
                                    color: Color(0xFF1D1517),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '6 items',
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
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 125,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Meals.getIngredients().length,
                              // ber of items in the list
                              itemBuilder: (BuildContext context, int index) {
                                // Each item is a container with a box shadow
                                Meals meals = Meals.getIngredients()[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0 ? 20 : 10,
                                    // Left padding for first item is 20, others 10
                                    right: index ==
                                            Meals.getIngredients().length - 1
                                        ? 20
                                        : 10, // Right padding for last item is 20, others 10
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF7F8F8),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                              child: SvgPicture.asset(
                                                  meals.imgPath)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              meals.name,
                                              style: TextStyle(
                                                color: Color(0xFF1D1517),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              meals.details,
                                              style: TextStyle(
                                                color: Color(0xFF7B6F72),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          /// Add spacing
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ExercisesSet.getSetData().length,
                            // ber of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              // Each item is a container with a box shadow
                              ExercisesSet sets =
                                  ExercisesSet.getSetData()[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Set ' +
                                          ExercisesSet.getSetData()[index].num,
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: sets.exercises.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                new Image.asset(
                                                  sets.exercises[index].imgPath,
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    print(
                                                        'Error loading image: $error');
                                                    return Text(
                                                        'Error loading image');
                                                  },
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
                                                      sets.exercises[index]
                                                          .name,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF1D1517),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      sets.exercises[index]
                                                          .duration,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF7B6F72),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                );
              },
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
                      Navigator.pushNamed(context, RouteNames.workoutDetails);
                    },
                    child: const SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add to Breakfast Meal",
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
            )
          ],
        ),
      ),
    );
  }
}
