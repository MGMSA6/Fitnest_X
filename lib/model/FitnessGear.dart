class FitnessGear {
  final String imgPath;
  final String name;

  FitnessGear(this.imgPath, this.name);

  static List<FitnessGear> getFitnessGearData() {
    final List<FitnessGear> fitnessGear = [
      FitnessGear("assets/images/barbel.svg", "Barbell"),
      FitnessGear("assets/images/skipping-rope.svg", "Skipping Rope"),
      FitnessGear("assets/images/water-bottle.svg", "Bottle 1 Liters"),
    ];

    return fitnessGear;
  }
}
