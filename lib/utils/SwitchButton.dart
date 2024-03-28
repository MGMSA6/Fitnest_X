import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.0, // Set width
      height: 18.0, // Set height
      child: Switch.adaptive(
        value: _switchValue,
        onChanged: (newValue) {
          setState(() {
            _switchValue = newValue;
          });
        },
        activeColor: Colors.blue,
        // Change the color of the active switch
        activeTrackColor: Colors.lightBlueAccent,
        // Change the color of the active switch track
        inactiveThumbColor: Colors.grey,
        // Change the color of the inactive switch
        inactiveTrackColor: Colors.grey[300],
        // Change the color of the inactive switch track
        materialTapTargetSize: MaterialTapTargetSize
            .shrinkWrap, // Remove extra padding around the switch
      ),
    );
  }
}
