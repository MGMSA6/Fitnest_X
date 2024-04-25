import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRepetition {
  final String imgPath;
  final String calories;
  final String times;
  final String text3;

  CustomRepetition(this.imgPath, this.calories, this.times, this.text3);

  static List<CustomRepetition> getCustomRepetition() {
    final List<CustomRepetition> customRepetition = [
      CustomRepetition(
          "assets/images/calories.svg", "450 Calories Burn", "30", "times"),
      CustomRepetition(
          "assets/images/calories.svg", "550 Calories Burn", "35", "times"),
      CustomRepetition(
          "assets/images/calories.svg", "650 Calories Burn", "40", "times"),
      CustomRepetition(
          "assets/images/calories.svg", "750 Calories Burn", "45", "times"),
      CustomRepetition(
          "assets/images/calories.svg", "850 Calories Burn", "50", "times")
    ];
    return customRepetition;
  }
}

class CustomPickerItemWidget extends StatelessWidget {
  final CustomRepetition repetition;

  const CustomPickerItemWidget({required this.repetition});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              repetition.imgPath,
              height: 14,
              width: 14,
            ),
            Text(
              repetition.calories,
              style: TextStyle(
                color: Color(0xFFACA3A5),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              repetition.times,
              style: TextStyle(
                color: Color(0xFF7B6F72),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              repetition.text3,
              style: TextStyle(
                color: Color(0xFFACA3A5),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
