import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<LatestWorkOut> latestWorkOut = [
    LatestWorkOut("assets/images/pancake.svg", "Fullbody Workout",
        "180 Calories Burn | 20minutes", AppColor.blueBg),
    LatestWorkOut("assets/images/workout2.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/workout3.svg", "Ab Workout",
        "180 Calories Burn | 20minutes", AppColor.blueBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/workout2.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.blueBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/workout3.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/workout2.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake2.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake2.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg),
    LatestWorkOut("assets/images/cake1.svg", "Lowerbody Workout",
        "200 Calories Burn | 30minutes", AppColor.pinkBg)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Notification',
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
              Expanded(
                child: ListView.separated(
                  itemCount: latestWorkOut.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    LatestWorkOut workOut = latestWorkOut[index];
                    return Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: workOut.gradient,
                                ),
                                child: SvgPicture.asset(workOut.img),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_vert_rounded,
                            size: 18,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LatestWorkOut {
  final String img;
  final String title;
  final String description;
  final Gradient gradient;

  LatestWorkOut(this.img, this.title, this.description, this.gradient);
}
