import 'package:fitnest_x/pages/auth/Carousel.dart';
import 'package:fitnest_x/pages/auth/Finalized.dart';
import 'package:fitnest_x/pages/auth/Login.dart';
import 'package:fitnest_x/pages/auth/SignUp.dart';
import 'package:fitnest_x/pages/auth/Signup1.dart';
import 'package:fitnest_x/pages/dashboard/Activity.dart';
import 'package:fitnest_x/pages/dashboard/Camera.dart';
import 'package:fitnest_x/pages/dashboard/Dashboard.dart';
import 'package:fitnest_x/pages/dashboard/Profile.dart';
import 'package:fitnest_x/pages/dashboard/WorkoutFinished.dart';
import 'package:fitnest_x/pages/onboarding/Notifications.dart';
import 'package:fitnest_x/pages/onboarding/Welcome.dart';
import 'package:fitnest_x/pages/workout-tracker/AddSchedule.dart';
import 'package:fitnest_x/pages/workout-tracker/Cal.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutDetails.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutSchedule.dart';
import 'package:fitnest_x/pages/workout-tracker/WorkoutTracker.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../pages/dashboard/Home.dart';
import '../../pages/onboarding/Onboarding.dart';
import '../../pages/onboarding/Welcome1.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.welcome:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Welcome());
      case RouteNames.welcome1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Welcome1());
      case RouteNames.onboarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Onboarding());
      case RouteNames.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUp());
      case RouteNames.signUp1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Signup1());
      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login());
      case RouteNames.finalized:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Finalized());
      case RouteNames.carousel:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Carousel());
      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home());
      case RouteNames.notification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Notifications());
      case RouteNames.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Profile());
      case RouteNames.activity:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Activity());
      case RouteNames.camera:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Camera());
      case RouteNames.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Dashboard());
      case RouteNames.workoutFinished:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WorkoutFinished());
      case RouteNames.workoutTracker:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WorkoutTracker());
      case RouteNames.workoutDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WorkoutDetails());
      case RouteNames.workoutSchedule:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WorkoutSchedule());
      case RouteNames.addSchedule:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddSchedule());
      case RouteNames.cal:
        return MaterialPageRoute(builder: (BuildContext context) => Cal());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No routes defined"),
            ),
          );
        });
    }
  }
}