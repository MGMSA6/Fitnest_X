import 'package:fitnest_x/pages/auth/Carousel.dart';
import 'package:fitnest_x/pages/auth/Finalized.dart';
import 'package:fitnest_x/pages/dashboard/Activity.dart';
import 'package:fitnest_x/pages/dashboard/Camera.dart';
import 'package:fitnest_x/pages/dashboard/Dashboard.dart';
import 'package:fitnest_x/pages/dashboard/Home.dart';
import 'package:fitnest_x/pages/auth/Login.dart';
import 'package:fitnest_x/pages/dashboard/Profile.dart';
import 'package:fitnest_x/pages/dashboard/WorkoutFinished.dart';
import 'package:fitnest_x/pages/onboarding/Notifications.dart';
import 'package:fitnest_x/pages/onboarding/Onboarding.dart';
import 'package:fitnest_x/pages/auth/SignUp.dart';
import 'package:fitnest_x/pages/auth/Signup1.dart';

import 'package:fitnest_x/pages/onboarding/Welcome.dart';
import 'package:fitnest_x/pages/onboarding/Welcome1.dart';
import 'package:fitnest_x/pages/workout-tracker/AddSchedule.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutDetails.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutSchedule.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutTracker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      initialRoute: "/WorkoutSchedule",
      routes: {
        "/Welcome": (context) => const Welcome(),
        "/Welcome1": (context) => const Welcome1(),
        "/Walkthrough": (context) => const Onboarding(),
        "/SignUp": (context) => const SignUp(),
        "/SignUp1": (context) => const Signup1(),
        "/Login": (context) => const Login(),
        "/Finalized": (context) => const Finalized(),
        "/Carousel": (context) => const Carousel(),
        "/Home": (context) => const Home(),
        "/Notification": (context) => const Notifications(),
        "/Profile": (context) => const Profile(),
        "/Activity": (context) => const Activity(),
        "/Camera": (context) => const Camera(),
        "/Dashboard": (context) => const Dashboard(),
        "/WorkoutFinished": (context) => const WorkoutFinished(),
        "/WorkoutTracker": (context) => const WorkoutTracker(),
        "/WorkoutDetails": (context) => const WorkoutDetails(),
        "/WorkoutSchedule": (context) => WorkoutSchedule(),
        "/AddSchedule": (context) => AddSchedule(),
        // "/Workout": (context) => const Workout()
      },
    );
  }
}
