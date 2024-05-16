import 'dart:math';

import 'package:flutter/material.dart';

class VerticalProgressBar extends StatelessWidget {
  final double progress;
  final Color startColor;
  final Color endColor;

  const VerticalProgressBar({
    Key? key,
    required this.progress,
    required this.startColor,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * (pi / 180), // Convert degrees to radians
      child: SizedBox(
        height: double.infinity,
        width: 25,
        child: Stack(
          children: [
            // Unfilled portion
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: const Color(0xFFF7F8F8),
              ),
            ),
            // Filled portion
            FractionallySizedBox(
              heightFactor: progress,
              // Set the progress value here (0.0 to 1.0)
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  gradient: LinearGradient(
                    colors: [startColor, endColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
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
