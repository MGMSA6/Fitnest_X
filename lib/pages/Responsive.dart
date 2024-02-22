import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Divide Screen'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text('Header'),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text('Middle'),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text('Footer'),
            ),
          ),
        ),
      ],
    );
  }
}
