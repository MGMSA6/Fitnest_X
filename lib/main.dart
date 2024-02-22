import 'package:fitnest_x/pages/Carousel.dart';
import 'package:fitnest_x/pages/Finalized.dart';
import 'package:fitnest_x/pages/Login.dart';
import 'package:fitnest_x/pages/Onboarding.dart';
import 'package:fitnest_x/pages/Responsive.dart';
import 'package:fitnest_x/pages/SignUp1.dart';
import 'package:fitnest_x/pages/Signup.dart';

import 'package:fitnest_x/pages/Welcome.dart';
import 'package:fitnest_x/pages/Welcome1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnestX());
}

class FitnestX extends StatelessWidget {
  const FitnestX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/Carousel",
      routes: {
        "/Welcome": (context) => const Welcome(),
        "/Welcome1": (context) => const Welcome1(),
        "/Walkthrough": (context) => const Onboarding(),
        "/SignUp": (context) => const Signup(),
        "/SignUp1": (context) => const SignUp1(),
        "/Login": (context) => const Login(),
        "/Finalized": (context) => const Finalized(),
        "/Carousel": (context) => const Carousel(),
        "/Responsive": (context) => Responsive()
      },
    );
  }
}
