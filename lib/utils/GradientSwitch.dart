import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';

class GradientSwitch extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final double paddingFactor;

  const GradientSwitch({
    Key? key,
    required this.onChanged,
    this.width = 38.0,
    this.height = 18.0,
    this.paddingFactor = 0.2,
  }) : super(key: key);

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
          widget.onChanged(
              _isSwitched); // Call the callback here with the updated switch state
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: _isSwitched
              ? AppColor.unitGradient
              : const LinearGradient(
                  colors: [Colors.grey, Colors.grey],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          borderRadius: BorderRadius.circular(widget.height / 2),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
                  _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(widget.height * widget.paddingFactor),
                child: Container(
                  width: widget.height * 0.6,
                  height: widget.height * 0.6,
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
