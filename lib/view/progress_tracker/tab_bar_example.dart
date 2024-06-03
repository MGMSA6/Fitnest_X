import 'package:fitnest_x/view/progress_tracker/photo.dart';
import 'package:fitnest_x/view/progress_tracker/statistic.dart';
import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Example'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Photo', icon: Icon(Icons.photo)),
                Tab(text: 'Statistic', icon: Icon(Icons.bar_chart)),
              ],
            ),
          ),
          body: TabBarView(
            children: [Photo(), Statistic()],
          ),
        ));
  }
}
