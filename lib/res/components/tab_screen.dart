import 'package:fitnest_x/res/colors.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final TabController tabController;

  const TabScreen({required this.tabController, Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<String> tabTitles = ["Photo", "Statistic"];

  // Configurable values
  double tabSwitcherWidth = 300.0;
  double tabSwitcherHeight = 50.0;
  double tabWidth = 130.0;
  double tabHeight = 40.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
              widget.tabController.animateTo(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: widget.tabController.index == index
                  ? tabWidth
                  : tabSwitcherWidth / tabTitles.length,
              height: tabHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                gradient: widget.tabController.index == index
                    ? AppColor.buttonColors
                    : null,
              ),
              child: Center(
                child: Text(
                  tabTitles[index],
                  style: TextStyle(
                    color: widget.tabController.index == index
                        ? Colors.white
                        : AppColor.inActiveTabText,
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
