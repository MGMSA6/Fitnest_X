import 'package:fitnest_x/view/dashboard/home_screen.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/routes/route_names.dart';

class Finalized extends StatefulWidget {
  const Finalized({Key? key}) : super(key: key);

  @override
  State<Finalized> createState() => _FinalizedState();
}

class _FinalizedState extends State<Finalized> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Column(
              children: [
                SvgPicture.asset("assets/images/welcome.svg"),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  AppString.wel,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.blackColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppString.finalDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColor.grayColor1),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
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
                        Navigator.pushNamed(
                          context,
                          RouteNames.home,
                        );
                      },
                      child: const SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.goHome,
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
            )),
          ),
        ),
      ),
    );
  }
}
