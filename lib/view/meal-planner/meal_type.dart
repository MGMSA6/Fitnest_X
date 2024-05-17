import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/FitnessGear.dart';
import '../../model/Meals.dart';
import '../../res/colors.dart';
import '../../utils/routes/route_names.dart';

class MealType extends StatefulWidget {
  const MealType({super.key});

  @override
  State<MealType> createState() => _MealTypeState();
}

class _MealTypeState extends State<MealType> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          'BreakFast',
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
                              child: const Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x111D1617),
                              blurRadius: 40,
                              offset: Offset(0, 10),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/search.svg"),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Search Pancake...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFDDD9DA),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            height: 24.0,
                            width: 1,
                            color: const Color(0xFFDDD9DA),
                          ),
                          IconButton(
                            icon: SvgPicture.asset("assets/images/filter.svg"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Category',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Meals.getMealsData1().length,
                      // ber of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        // Each item is a container with a box shadow
                        Meals meals = Meals.getMealsData1()[index];

                        // Apply padding based on index to control spacing between items
                        EdgeInsets itemPadding = EdgeInsets.only(
                          left: index == 0 ? 20 : 10,
                          // Start padding for first item, 10 for others
                          right: index == Meals.getMealsData1().length - 1
                              ? 20
                              : 10, // End padding for last item, 10 for others
                        );
                        return Container(
                          padding: itemPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: index.isEven
                                      ? AppColor.blueBg
                                      : AppColor.pinkBg,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: 40,
                                      height: 41,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                      child: SvgPicture.asset(
                                        meals.imgPath,
                                        width: 24,
                                        height: 16,
                                      ),
                                    ),
                                    Text(
                                      meals.name,
                                      style: const TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Recommendation\nfor Diet',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Meals.getMealsData2().length,
                      // ber of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        // Each item is a container with a box shadow
                        Meals meals = Meals.getMealsData2()[index];

                        // Apply padding based on index to control spacing between items
                        EdgeInsets itemPadding = EdgeInsets.only(
                          left: index == 0 ? 20 : 10,
                          // Start padding for first item, 10 for others
                          right: index == Meals.getMealsData2().length - 1
                              ? 20
                              : 10, // End padding for last item, 10 for others
                        );
                        return Container(
                          padding: itemPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 239,
                                decoration: BoxDecoration(
                                  gradient: index.isEven
                                      ? AppColor.blueBg
                                      : AppColor.pinkBg,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      meals.imgPath,
                                      width: 116,
                                      height: 80,
                                    ),
                                    Text(
                                      'Honey Pancake',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF1D1517),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Easy | 30mins | 180kCal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF7B6F72),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
