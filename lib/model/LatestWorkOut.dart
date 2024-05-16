import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../res/colors.dart';

class LatestWorkOut {
  final String img;
  final String title;
  final String description;
  final LinearGradient gradient;

  LatestWorkOut(this.img, this.title, this.description, this.gradient);

  static List<LatestWorkOut> getDummyData() {
    return [
      LatestWorkOut("assets/images/workout1.svg", "Fullbody Workout",
          "180 Calories Burn | 20minutes", AppColor.blueBg),
      LatestWorkOut("assets/images/workout2.svg", "Lowerbody Workout",
          "200 Calories Burn | 30minutes", AppColor.pinkBg),
      LatestWorkOut("assets/images/snack.svg", "Ab Workout",
          "180 Calories Burn | 20minutes", AppColor.blueBg)
    ];
  }
}
