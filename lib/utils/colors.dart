import 'package:flutter/widgets.dart';

class AppColor {
  AppColor._();

  static const Color blackColor = Color(0xff1D1617);
  static const Color grayColor1 = Color(0xff7B6F72);
  static const Color grayColor2 = Color(0xffADA4A5);
  static const Color grayColor3 = Color(0xffdddada);
  static const Color borderColor = Color(0xffF7F8F8);
  static const Color secondaryColor = Color(0xffC58BF2);
  static const Color secondaryColor1 = Color(0xffeea4ce);
  static const List<Color> gradientColors = [
    Color(0xff92A3FD),
    Color(0xff9DCEFF)
  ];

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  static const Gradient brandColors = LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.0),
    transform: GradientRotation(274 * (3.1415926535 / 180.0)),
    colors: [
      Color(0xff92A3FD),
      Color(0xff9DCEFF),
    ],
    stops: [0.0, 1.2445],
  );

  static const Gradient buttonColors = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xff92A3FD),
      Color(0xff9DCEFF),
    ],
  );

  static const LinearGradient textGradient = LinearGradient(
    begin: Alignment(-0.83, 0.0),
    end: Alignment(0.86, 0.0),
    colors: [Color(0xffCC8FED), Color(0xff9DCEFF)],
  );

  static const Gradient unitGradient = LinearGradient(
    colors: [Color(0xffC58BF2), Color(0xffeea4ce)],
    // Replace with your gradient colors
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient cardsGradient = LinearGradient(
    colors: AppColor.gradientColors,
    begin: Alignment.bottomRight,
    end: Alignment.bottomLeft,
  );
}
