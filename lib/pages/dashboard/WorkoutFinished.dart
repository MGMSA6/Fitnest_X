import 'package:fitnest_x/pages/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';

class WorkoutFinished extends StatefulWidget {
  const WorkoutFinished({super.key});

  @override
  State<WorkoutFinished> createState() => _WorkoutFinishedState();
}

class _WorkoutFinishedState extends State<WorkoutFinished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: SvgPicture.asset("assets/images/frame.svg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Congratulations, You Have Finished Your Workout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1D1517),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Exercises is king and nutrition is queen. Combine the two and you will have a kingdom',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7B6F72),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  '-Jack Lalanne',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7B6F72),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()));
                  },
                  child: const SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Back To Home",
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
          ],
        ),
      ),
    );
  }
}
