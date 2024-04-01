import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';

class GradientSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const GradientSwitch({Key? key, required this.onChanged}) : super(key: key);

  @override
  _GradientSwitchState createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSwitched = !_isSwitched;
          widget.onChanged(_isSwitched); // Call the callback here with the updated switch state
        });
      },
      child: Container(
        width: 38.0,
        height: 18.0,
        decoration: BoxDecoration(
          gradient: _isSwitched
              ? AppColor.unitGradient
              : const LinearGradient(
            colors: [Colors.grey, Colors.grey],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}