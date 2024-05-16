import 'dart:math';

import 'package:flutter/cupertino.dart';

class CircularGradientProgressBar extends StatelessWidget {
  final double strokeWidth;
  final double value;
  final Gradient gradient;
  final Color? unfilledColor; // Unfilled color
  final double radius;
  final Widget child; // Child widget to be placed in the center

  CircularGradientProgressBar({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
    required this.unfilledColor,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CircularGradientProgressBarPainter(
            strokeWidth: strokeWidth,
            value: value,
            gradient: gradient,
            unfilledColor: unfilledColor,
            radius: radius,
          ),
          size: Size(radius * 2, radius * 2),
        ),
        Center(
          child: child,
        ),
      ],
    );
  }
}

class CircularGradientProgressBarPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final Gradient gradient;
  final Color? unfilledColor; // Unfilled color
  final double radius;

  CircularGradientProgressBarPainter({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
    required this.unfilledColor,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double effectiveRadius =
        radius - strokeWidth / 2; // Adjust for stroke width

    // Draw unfilled arc
    if (unfilledColor != null) {
      final Paint unfilledPaint = Paint()
        ..color = unfilledColor!
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      final Offset center = Offset(radius, radius);
      final double startAngle = -pi / 2; // Start angle at 12 o'clock position
      final double sweepAngle = 2 * pi; // Full circle

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: effectiveRadius),
        startAngle,
        sweepAngle,
        false,
        unfilledPaint,
      );
    }

    // Draw filled arc
    final Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
          center: Offset(radius, radius),
          radius: effectiveRadius,
        ),
      )
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Offset center = Offset(radius, radius);
    final double startAngle = -pi / 2; // Start angle at 12 o'clock position
    final double sweepAngle =
        value * 2 * pi; // Sweep angle is proportional to value

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: effectiveRadius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}