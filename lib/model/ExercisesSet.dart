import 'Exercises.dart';

class ExercisesSet {
  final String num;
  final List<Exercises> exercises;

  ExercisesSet(this.num, this.exercises);

  static List<ExercisesSet> getSetData() {
    final List<ExercisesSet> exercises = [
      ExercisesSet("1", getExercisesData1()),
      ExercisesSet("2", getExercisesData2()),
    ];
    return exercises;
  }

  static List<Exercises> getExercisesData1() {
    final List<Exercises> exercises = [
      Exercises("assets/images/warm_up.png", "Warm Up", "05:00"),
      Exercises("assets/images/jumping_jack.png", "Jumping Jack", "12x"),
      Exercises("assets/images/skipping.png", "Skipping", "15x"),
      Exercises("assets/images/squats.png", "Squats", "20x"),
      Exercises("assets/images/arm_raises.png", "Arm Raises", "00:53"),
      Exercises("assets/images/rest_drink.png", "Rest and Drink", "02:00"),
    ];
    return exercises;
  }

  static List<Exercises> getExercisesData2() {
    final List<Exercises> exercises = [
      Exercises(
          "assets/images/incline_push_ups.png", "Incline Push-Ups", "05:00"),
      Exercises("assets/images/push_ups.png", "Push-Ups", "12x"),
      Exercises("assets/images/skipping.png", "Skipping", "15x"),
      Exercises("assets/images/cobra_stretch.png", "Cobra Stretch", "20x"),
    ];
    return exercises;
  }
}
