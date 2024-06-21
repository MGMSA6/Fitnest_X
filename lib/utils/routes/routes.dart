import 'package:fitnest_x/view/auth/carousel_screen.dart';
import 'package:fitnest_x/view/auth/finalized_screen.dart';
import 'package:fitnest_x/view/auth/login_screen.dart';
import 'package:fitnest_x/view/auth/sign_up_screen.dart';
import 'package:fitnest_x/view/auth/sign_up1_screen.dart';
import 'package:fitnest_x/view/dashboard/activity_screen.dart';
import 'package:fitnest_x/view/dashboard/camera_photo_screen.dart';
import 'package:fitnest_x/view/dashboard/dashboard_screen.dart';
import 'package:fitnest_x/view/dashboard/profile_screen.dart';
import 'package:fitnest_x/view/dashboard/workout_finished_screen.dart';
import 'package:fitnest_x/view/onboarding/notification_screen.dart';
import 'package:fitnest_x/view/onboarding/welcome_screen.dart';

import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:fitnest_x/view/progress_tracker/comparison_screen.dart';
import 'package:fitnest_x/view/progress_tracker/progress_photo_screen.dart';
import 'package:fitnest_x/view/progress_tracker/photo_screen.dart';
import 'package:fitnest_x/view/progress_tracker/statistic_screen.dart';
import 'package:fitnest_x/view/progress_tracker/tab_bar_example.dart';
import 'package:fitnest_x/view/sleep_tracker/add_alarm_screen.dart';
import 'package:fitnest_x/view/sleep_tracker/sleep_schedule_screen.dart';
import 'package:fitnest_x/view/sleep_tracker/sleep_track_screen.dart';
import 'package:flutter/material.dart';

import '../../view/dashboard/home_screen.dart';
import '../../view/meal_planner/meal_planner.dart';
import '../../view/meal_planner/meal_schedule.dart';
import '../../view/meal_planner/meal_type.dart';
import '../../view/onboarding/onboarding_screen.dart';
import '../../view/onboarding/welcome1_screen.dart';
import '../../view/progress_tracker/result_screen.dart';
import '../../view/workout_tracker/cal_screen.dart';
import '../../view/workout_tracker/add_schedule_screen.dart';
import '../../view/workout_tracker/workout_details_screen.dart';
import '../../view/workout_tracker/workout_schedule_screen.dart';
import '../../view/workout_tracker/workout_tracker_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print("Navigating to: ${settings.name}"); // Debug print
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
            builder: (BuildContext context) => const Camera_Photo());
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
      case RouteNames.mealPlanner:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MealPlanner());
      case RouteNames.mealType:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MealType());
      case RouteNames.mealSchedule:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MealSchedule());
      case RouteNames.sleepTrack:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SleepTrack());
      case RouteNames.sleepSchedule:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SleepSchedule());
      case RouteNames.addAlarm:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddAlarm());
      case RouteNames.progressPhoto:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProgressPhoto());
      case RouteNames.comparison:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Comparison());
      case RouteNames.result:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Result());
      case RouteNames.photo:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Photo());
      case RouteNames.statistic:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Statistic());
      case RouteNames.tabBarExample:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TabBarExample());
      // case RouteNames.mealDetails:
      //   return MaterialPageRoute(builder: (BuildContext context) => const MealDetails(trainingTarget: trainingTarget));
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
