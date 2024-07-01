import 'package:flutter/material.dart';

import '../../view/onboarding/onboarding_screen.dart';

class CircularProgressButton extends StatefulWidget {
  const CircularProgressButton({super.key});

  @override
  _CircularProgressButtonState createState() => _CircularProgressButtonState();
}

class _CircularProgressButtonState extends State<CircularProgressButton> {
  final PageController _pageController = PageController();
  final double _progressValue = 0.75; // Example progress value

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                builder: (BuildContext context, double value, Widget? child) {
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
                      context, '/carousel'); // Adjust route name
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
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green
                    ], // Adjust gradient colors
                  ),
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
    );
  }
}
