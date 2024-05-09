import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:fitnest_x/pages/workout-tracker/DayViewWidget.dart';
import 'package:flutter/material.dart';

class Cal extends StatelessWidget {
  Cal({super.key});

  List<CalendarEventData> _events = [
    CalendarEventData(
      date: DateTime.now(),
      title: "Project meeting",
      description: "Today is project meeting.",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 18, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 22),
    ),
    CalendarEventData(
      date: DateTime.now().add(Duration(days: 1)),
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 18),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 19),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: MaterialApp(
        title: 'Flutter Calendar Page Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: DayViewWidget(),
      ),
    );
  }
}
