class TrainingTarget {
  final String title;
  final String description;
  final String imagePath;

  TrainingTarget({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  static List<TrainingTarget> getDummyData() {
    return [
      TrainingTarget(
        title: "Fullbody Workout",
        description: "180 Calories Burn | 20 minutes",
        imagePath: "assets/images/workout1.svg",
      ),
      TrainingTarget(
        title: "Lowerbody Workout",
        description: "200 Calories Burn | 30 minutes",
        imagePath: "assets/images/workout2.svg",
      ),
      TrainingTarget(
        title: "Ab Workout",
        description: "180 Calories Burn | 20 minutes",
        imagePath: "assets/images/workout3.svg",
      ),
    ];
  }
}
