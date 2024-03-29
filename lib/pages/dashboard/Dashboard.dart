import 'package:fitnest_x/pages/dashboard/Home.dart';
import 'package:fitnest_x/pages/dashboard/Profile.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Activity.dart';
import 'Camera.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Activity(),
    Camera(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset("assets/images/home_active.svg")
                  : SvgPicture.asset("assets/images/home.svg"),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset("assets/images/activity_active.svg")
                  : SvgPicture.asset("assets/images/activity.svg"),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            IconButton(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset("assets/images/camera_active.svg")
                  : SvgPicture.asset("assets/images/camera.svg"),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
            IconButton(
              icon: _selectedIndex == 3
                  ? SvgPicture.asset("assets/images/profile_active.svg")
                  : SvgPicture.asset("assets/images/profile2.svg"),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        elevation: 5.0,
        shape: const CircleBorder(),
        child: Container(
          height: 65,
          width: 65,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, gradient: AppColor.buttonColors),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(55),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  "assets/images/search_white.svg",
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
