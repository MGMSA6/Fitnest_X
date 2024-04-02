import 'dart:ui';

class DayInfo {
  final String text;
  final Color startColor;
  final Color endColor;
  final double progress;

  DayInfo(
      {required this.text,
      required this.startColor,
      required this.endColor,
      required this.progress});
}
