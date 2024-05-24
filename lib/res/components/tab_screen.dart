import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  List<String> tabTitles = ["Photo", "Statistic"];

  // Configurable values
  double tabSwitcherWidth = 300.0;
  double tabSwitcherHeight = 50.0;
  double tabWidth = 130.0;
  double tabHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: AppColor.borderColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            tabTitles.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _selectedIndex == index
                    ? tabWidth
                    : tabSwitcherWidth / tabTitles.length,
                height: tabHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  gradient:
                      _selectedIndex == index ? AppColor.buttonColors : null,
                ),
                child: Center(
                  child: Text(
                    tabTitles[index],
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.white
                          : AppColor.inActiveTabText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
