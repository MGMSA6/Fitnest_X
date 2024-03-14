import 'package:fitnest_x/pages/Onboarding.dart';
import 'package:fitnest_x/utils/strings.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Column(
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
                GradientText(
                  text: AppString.X,
                  gradient: AppColor.textGradient,
                  style: TextStyle(
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
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  // Adjust margin as needed
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColor.brandColors,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(99),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          AppString.startButtonLabel,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                      ),
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
