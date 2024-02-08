import 'package:fitnest_x/pages/Onboarding.dart';
import 'package:flutter/material.dart';

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
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              transform: GradientRotation(274 * (3.1415926535 / 180.0)),
              colors: [
                Color(0xFF92A3FD),
                Color(0xFF9DCEFF),
              ],
              stops: [0.0, 1.2445],
            ),
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
                    'Fitnest',
                    style: TextStyle(
                      color: Color(0XFF1D1617),
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'X',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Text(
                'Everybody Can Train',
                style: TextStyle(
                  color: Color(0XFF7B6F72),
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
                          text: "Get Started",
                          gradient: LinearGradient(
                            begin: Alignment(-0.83, 0.0),
                            end: Alignment(0.86, 0.0),
                            colors: [Color(0xFFCC8FED), Color(0xFF9DCEFF)],
                          ),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Onboarding()));
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