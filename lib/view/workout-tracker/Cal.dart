import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import '../../res/colors.dart'; // Import your color constants here

class Cal extends StatelessWidget {
  Cal({Key? key}) : super(key: key);

  final List<CalendarEventData> _events = [
    // Add today's 8 PM event
    CalendarEventData(
      date: DateTime.now(),
      title: "New Event",
      // Replace with your desired title
      description: "This is a new event for today.",
      startTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        20, // Set hour to 8 PM
        0, // Set minute to 0
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        22, // Set end time if needed (optional)
        0, // Set minute to 0 (optional)
      ),
    ),
    // ... your existing events (optional)
  ];



  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: double.maxFinite,
            child: Material(
              child: DayView(

              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventTile(CalendarEventData event) {
    // Customize the event tile based on your needs
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(event.title),
    );
  }
}
