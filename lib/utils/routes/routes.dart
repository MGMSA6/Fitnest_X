import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:flutter/material.dart';
import '../../view/onboarding/welcome_screen.dart';
import '../../view/view.dart';

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
