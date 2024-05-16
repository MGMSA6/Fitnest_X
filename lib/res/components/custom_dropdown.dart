import 'package:flutter/material.dart';

import '../colors.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99.0),
        gradient: AppColor.buttonColors,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
          value: widget.selectedValue,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
          ),
          onChanged: widget.onChanged,
          items: widget.items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}
