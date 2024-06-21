import 'package:fitnest_x/view/onboarding/onboarding_screen.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_names.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({super.key});

  @override
  State<Welcome1> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.brandColors,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              // To center the content vertically
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.appName,
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    AppString.X,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Text(
                AppString.trainAll,
                style: TextStyle(
                  color: AppColor.grayColor1,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Expanded(child: SizedBox()),
              // To center the content vertically

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      // Adjust margin as needed
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: GradientText(
                          text: AppString.startButtonLabel,
                          gradient: AppColor.textGradient,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.onboarding,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final LinearGradient gradient;
  final TextStyle style;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
