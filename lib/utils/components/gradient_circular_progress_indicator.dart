import 'dart:math';

import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final VoidCallback onPressed;

  const GradientCircularProgressIndicator({
    required this.progress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: _GradientCircularProgressPainter(progress),
          size: Size(65, 65),
        ),
        GradientCircularButton(
          onPressed: onPressed,
          key: UniqueKey(),
        ),
      ],
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double progress;

  _GradientCircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double lineWidth = 3.0;
    Rect rect = Offset.zero & size;
    Gradient gradient = AppColor.brandColors;

    Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -pi / 2,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Needs to repaint when progress changes
  }
}

class GradientCircularButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientCircularButton({
    required Key key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColor.brandColors,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}