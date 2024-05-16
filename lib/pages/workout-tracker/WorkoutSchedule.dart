import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/CustomDatePickerTimeline.dart';
import '../../utils/colors.dart';
import '../../utils/routes/route_names.dart';

class WorkoutSchedule extends StatefulWidget {
  const WorkoutSchedule({super.key});

  @override
  State<WorkoutSchedule> createState() => _WorkoutScheduleState();
}

class _WorkoutScheduleState extends State<WorkoutSchedule> {
  bool isHeartFilled = false;
  final DateTime _selectedDate = DateTime.now();

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
        10, // Set hour to 8 PM
        0, // Set minute to 0
      ),
      endTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        11, // Set end time if needed (optional)
        0, // Set minute to 0 (optional)
      ),
    ),
    // ... your existing events (optional)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF7F8F8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Workout Schedule',
                            style: TextStyle(
                              color: Color(0xFF1D1517),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFF7F8F8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {},
                                child: Icon(Icons.more_horiz),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/images/arrow_left.svg"),
                          Text(
                            'May 2021',
                            style: TextStyle(
                              color: Color(0xFFACA3A5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SvgPicture.asset("assets/images/icon_arrow.svg"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDatePickerTimeline(
                      onDateChange: (DateTime) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: SizedBox(
                    height: 500,
                    child: CalendarControllerProvider(
                      controller: EventController()..addAll(_events),
                      child: Material(
                          child: DayView(
                        eventTileBuilder: (date, events, boundry, start, end) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: AppColor.unitGradient,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  _showPopupModal(context);
                                },
                                child: Center(
                                  child: Text(
                                    "Upper Workout, 9am",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onEventTap: (events, date) => print(events),
                        dayTitleBuilder: DayHeader.hidden,
                        showVerticalLine: false,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: AppColor.unitGradient,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4CC58BF2),
                      blurRadius: 22,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.addSchedule);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.add_rounded, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPopupModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 243.0,
            width: 315.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'Workout Schedule',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.more_vert_rounded,
                      size: 18,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upperbody workout',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/icon.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Today | 09:00PM',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppColor.buttonColors,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(
                            0, 4), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mark as Done",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
