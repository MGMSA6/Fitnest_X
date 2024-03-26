import 'dart:ui';

import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';

class IndicatorData {
  final String text1;
  final String text2;

  IndicatorData({required this.text1, required this.text2});
}

class TimelineItem extends CustomPainter {
  final int numberOfIndicators;
  final double indicatorSpacing;
  final double indicatorRadius;
  final double dashSpace;
  final List<IndicatorData> indicatorData;
  final double textPaddingStart;

  TimelineItem({
    required this.numberOfIndicators,
    this.indicatorSpacing = 20.0,
    this.indicatorRadius = 5.0,
    this.dashSpace = 8.0,
    required this.indicatorData,
    this.textPaddingStart = 5.0, // Default padding value
  });

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5;
    final centerX = size.width / 2;

    final totalSpacing = indicatorSpacing * (numberOfIndicators - 1);
    final availableHeight = size.height - totalSpacing;

    for (int i = 0; i < numberOfIndicators; i++) {
      final startY = (indicatorRadius * 2 + indicatorSpacing) * i;

      // Draw circle indicator
      final linePaint = Paint()
        ..color = const Color(0xFFC58BF2) // You can set the color as you need
        ..strokeWidth = size.width;
      canvas.drawCircle(
        Offset(centerX, startY + indicatorRadius),
        indicatorRadius,
        linePaint,
      );

      // Draw rectangle indicator container
      final indicatorContainerRect = Rect.fromCircle(
        center: Offset(centerX, startY + indicatorRadius),
        radius: indicatorRadius * 4,
      );
      canvas.drawCircle(
        Offset(centerX, startY + indicatorRadius),
        indicatorRadius * 4,
        linePaint,
      );

      // Draw first text
      TextPainter(
        text: TextSpan(
          text: indicatorData[i].text1,
          style: const TextStyle(
              color: Color(0xFFACA3A5),
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              height: 0.18),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout()
        ..paint(
          canvas,
          Offset(centerX + indicatorRadius * 5 + textPaddingStart,
              startY + indicatorRadius),
        );

      // Draw second text with gradient color
      final gradient = AppColor.unitGradient.createShader(Rect.fromLTWH(
          centerX + indicatorRadius * 5,
          startY + indicatorRadius,
          indicatorRadius * 4,
          16)); // 16 is an approximation of the text height
      TextPainter(
        text: TextSpan(
          text: indicatorData[i].text2,
          style: TextStyle(
              fontSize: 10.0,
              foreground: Paint()..shader = gradient,
              fontWeight: FontWeight.w400),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout()
        ..paint(
          canvas,
          Offset(centerX + indicatorRadius * 5 + textPaddingStart,
              startY + indicatorRadius + 12),
        );

      // Draw connecting dashed lines
      if (i < numberOfIndicators - 1) {
        double lineY = startY + indicatorRadius * 2;
        final linePaint = Paint()
          ..color = Color(0xFFC58BF2) // You can set the color as you need
          ..strokeWidth = 1;
        while (lineY + dashHeight <
            (indicatorRadius * 2 + indicatorSpacing) * (i + 1)) {
          canvas.drawLine(
            Offset(centerX, lineY),
            Offset(centerX, lineY + dashHeight),
            linePaint,
          );
          lineY += dashHeight + dashSpace;
        }
      }
    }
  }

  @override
  bool shouldRepaint(TimelineItem oldDelegate) => false;
}
