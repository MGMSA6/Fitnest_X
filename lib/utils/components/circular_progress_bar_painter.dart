import 'package:flutter/material.dart';

class CircularProgressBarPainter extends CustomPainter {
  final double progress;

  CircularProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 8.0;
    Rect rect = Offset.zero & size;
    Paint paint = Paint()
      ..shader = SweepGradient(
        colors: const [Colors.blue, Colors.green],
        startAngle: 0.0,
        endAngle: progress * 2 * 3.141592653589793,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2, size.width - strokeWidth,
          size.height - strokeWidth),
      -3.141592653589793 / 2, // Start from top
      progress * 2 * 3.141592653589793, // Sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
