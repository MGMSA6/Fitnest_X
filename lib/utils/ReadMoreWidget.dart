import 'package:flutter/material.dart';

class ReadMoreWidget extends StatefulWidget {
  final String initialText;
  final String remainingText;

  ReadMoreWidget({required this.initialText, required this.remainingText});

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String displayText = _isExpanded
        ? widget.initialText + ' ' + widget.remainingText
        : widget.initialText + '...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
                color: Color(0xFF7B6F72),
                fontSize: 12,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(text: displayText),
              if (!_isExpanded)
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = true;
                      });
                    },
                    child: Text(
                      ' Read more',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF92A3FD),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              if (_isExpanded)
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                    child: Text(
                      ' Read less',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF92A3FD),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
