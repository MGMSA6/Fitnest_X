import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class IndicatorData {
  final String text1;
  final String text2;
  final int count;

  IndicatorData({
    required this.text1,
    required this.text2,
    required this.count,
  });
}

class TimelineItem extends CustomPainter {
  final int numberOfIndicators;
  final double indicatorSpacing;
  final double indicatorRadius;
  final double dashSpace;
  final List<IndicatorData> indicatorData;
  final double textPaddingStart;
  final double countIndicatorSpacing; // Spacing between count and indicator

  TimelineItem({
    required this.numberOfIndicators,
    this.indicatorSpacing = 20.0,
    this.indicatorRadius = 5.0,
    this.dashSpace = 8.0,
    required this.indicatorData,
    this.textPaddingStart = 5.0,
    this.countIndicatorSpacing = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5;
    final centerX = size.width / 2;

    final totalSpacing = indicatorSpacing * (numberOfIndicators - 1);
    final availableHeight = size.height - totalSpacing;

    for (int i = 0; i < numberOfIndicators; i++) {
      final startY = (indicatorRadius * 2 + indicatorSpacing) * i;

      // Draw count text with gradient color
      final countGradient = AppColor.unitGradient.createShader(Rect.fromLTWH(
        centerX - indicatorRadius * 8 - countIndicatorSpacing,
        startY + indicatorRadius - 8,
        indicatorRadius * 4,
        16,
      ));

      TextPainter(
        text: TextSpan(
          text: indicatorData[i].count.toString(),
          style: TextStyle(
            fontSize: 12.0,
            foreground: Paint()..shader = countGradient,
            fontWeight: FontWeight.w400,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout()
        ..paint(
          canvas,
          Offset(centerX - indicatorRadius * 8 - countIndicatorSpacing,
              startY + indicatorRadius - 8),
        );

      // Draw circle indicator
      final linePaint = Paint()
        ..color = const Color(0xFFC58BF2)
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

      // Draw first text (text1)
      TextPainter(
        text: TextSpan(
          text: '${indicatorData[i].text1}',
          style: const TextStyle(
            color: Color(0xFF1D1517),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0.18,
          ),
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

      // Draw second text (text2) with gradient color
      TextPainter(
        text: TextSpan(
          text: indicatorData[i].text2,
          style: TextStyle(
            color: Color(0xFF7B6F72),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        textAlign: TextAlign.left,
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
          ..color = Color(0xFFC58BF2)
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
