import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Welcome Back,",
                  style: TextStyle(fontSize: 15, color: Color(0xff1D1617)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
