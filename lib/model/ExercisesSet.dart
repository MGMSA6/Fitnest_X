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
      Exercises("assets/images/warm-up.svg", "Warm Up", "05:00"),
      Exercises("assets/images/.svg", "Jumping Jack", "12x"),
      Exercises("assets/images/.svg", "Skipping", "15x"),
      Exercises("assets/images/.svg", "Squats", "20x"),
      Exercises("assets/images/.svg", "Arm Raises", "00:53"),
      Exercises("assets/images/.svg", "Rest and Drink", "02:00"),
    ];
    return exercises;
  }

  static List<Exercises> getExercisesData2() {
    final List<Exercises> exercises = [
      Exercises("assets/images/.svg", "Incline Push-Ups", "05:00"),
      Exercises("assets/images/.svg", "Push-Ups", "12x"),
      Exercises("assets/images/.svg", "Skipping", "15x"),
      Exercises("assets/images/.svg", "Cobra Stretch", "20x"),
    ];
    return exercises;
  }
}
