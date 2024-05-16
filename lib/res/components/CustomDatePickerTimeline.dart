import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerTimeline extends StatefulWidget {
  final Function(DateTime) onDateChange;

  const CustomDatePickerTimeline({Key? key, required this.onDateChange})
      : super(key: key);

  @override
  State<CustomDatePickerTimeline> createState() =>
      _CustomDatePickerTimelineState();
}

class _CustomDatePickerTimelineState extends State<CustomDatePickerTimeline> {
  // Define variables to store selected date and list of dates
  late DateTime _selectedDate;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    // Initialize selected date to today
    _selectedDate = DateTime.now();
    // Generate list of dates for the timeline (e.g., 7 days before and after today)
    _dates = _generateDateList();
  }

  // Function to generate a list of dates for the timeline
  List<DateTime> _generateDateList() {
    DateTime currentDate = DateTime.now();
    DateTime futureDate =
        currentDate.add(const Duration(days: 36500)); // 100 years in the future
    List<DateTime> dates = [];
    for (DateTime date = currentDate;
        date.isBefore(futureDate);
        date = date.add(const Duration(days: 1))) {
      dates.add(date);
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjust height of the date picker timeline
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          DateTime date = _dates[index];
          // Check if current date is selected
          bool isSelected = date.year == _selectedDate.year &&
              date.month == _selectedDate.month &&
              date.day == _selectedDate.day;
          // Apply gradient color to selected box
          BoxDecoration boxDecoration = isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.08),
                    end: Alignment(1, -0.08),
                    colors: [Color(0xFF9DCEFF), Color(0xFF92A3FD)],
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF7F8F8), // Default color for unselected box
                );
          // Apply custom space between boxes
          EdgeInsets margin =
              EdgeInsets.only(right: 15); // Adjust space as needed
          return Container(
            margin: margin,
            width: 60,
            height: 80,
            decoration: boxDecoration,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  // Call onDateChange callback when a date is selected
                  widget.onDateChange(date);
                  setState(() {
                    _selectedDate = date;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE').format(date),
                      // Display short weekday name
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : Color(0xFF7B6F72),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Color(0xFF7B6F72),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
