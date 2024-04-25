import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/CustomRepetition.dart';

class CustomPickerItem extends StatefulWidget {
  const CustomPickerItem({super.key});

  @override
  State<CustomPickerItem> createState() => _CustomPickerItemState();
}

class _CustomPickerItemState extends State<CustomPickerItem> {
  // Get custom repetition data
  final List<CustomRepetition> customRepetitions =
      CustomRepetition.getCustomRepetition();

  int selectedItemIndex = 0; // Track selected item index

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Center(
        child: CupertinoPicker(
          backgroundColor: Colors.transparent,
          itemExtent: 40, // Adjust item height as needed
          children: customRepetitions.map((repetition) {
            return CustomPickerItemWidget(repetition: repetition);
          }).toList(),
          onSelectedItemChanged: (int index) {
            setState(() {
              selectedItemIndex = index;
            });
          },
        ),
      ),
    );
  }
}
