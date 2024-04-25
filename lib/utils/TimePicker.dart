import 'package:flutter/cupertino.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int selectedHour = 0;
  int selectedMinute = 0;
  int selectedPeriod = 0; // 0 for AM, 1 for PM

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPicker('Hour', _buildHourPicker()),
        _buildPicker('Minute', _buildMinutePicker()),
        _buildPicker('Period', _buildPeriodPicker()),
      ],
    );
  }

  Widget _buildPicker(String label, Widget picker) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(8),
          child: picker,
        ),
      ],
    );
  }

  Widget _buildHourPicker() {
    return CupertinoPicker.builder(
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedHour = index;
        });
      },
      childCount: 12,
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            (index + 1).toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }

  Widget _buildMinutePicker() {
    return CupertinoPicker.builder(
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedMinute = index;
        });
      },
      childCount: 60,
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            index.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }

  Widget _buildPeriodPicker() {
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedPeriod = index;
        });
      },
      children: <Widget>[
        Text('AM', style: TextStyle(fontSize: 18)),
        Text('PM', style: TextStyle(fontSize: 18)),
      ],
    );
  }

  String getFormattedTime() {
    int hour = selectedHour + (selectedPeriod == 1 ? 12 : 0);
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = selectedMinute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute';
  }
}
