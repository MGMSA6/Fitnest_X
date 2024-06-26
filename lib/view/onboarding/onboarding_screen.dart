import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../utils/routes/route_names.dart';
import '../auth/carousel_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  final double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: const [
                OnBoardingPage(
                  imageUrl: "assets/images/onboard1.svg",
                  title: AppString.trackGoal,
                  description: AppString.goalDescription,
                ),
                OnBoardingPage(
                  imageUrl: "assets/images/onboard2.svg",
                  title: AppString.getBurn,
                  description: AppString.burnDescription,
                ),
                OnBoardingPage(
                  imageUrl: "assets/images/onboard3.svg",
                  title: AppString.eatWell,
                  description: AppString.eatDescription,
                ),
                OnBoardingPage(
                  imageUrl: "assets/images/onboard4.svg",
                  title: AppString.sleepQuality,
                  description: AppString.sleepDescription,
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: SizedBox(
                width: 80, // Adjust the width as needed
                height: 80, // Adjust the height as needed
                child: Stack(
                  children: [
                    Center(
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 500),
                        tween: Tween<double>(begin: 0.0, end: _progressValue),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return CustomPaint(
                            painter: CircularProgressBarPainter(value),
                          );
                        },
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (_pageController.page == 3) {
                          Navigator.pushNamed(
                              this.context, RouteNames.carousel);
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => const Carousel()));
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: AppColor.buttonColors,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const OnBoardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 480),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.grayColor1,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progress;

  CircularProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = AppColor.buttonColors.createShader(
          Rect.fromCircle(center: size.center(Offset.zero), radius: 1.0))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    double startAngle = -0.5 * 2 * 3.14;
    double sweepAngle = progress * 2 * 3.14;

    canvas.drawArc(
        Rect.fromCircle(
            center: size.center(Offset.zero), radius: size.width / 2),
        startAngle,
        sweepAngle,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return false;
  }
}
