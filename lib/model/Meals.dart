class Meals {
  final String imgPath;
  final String name;
  final String details;

  Meals(this.imgPath, this.name, this.details);

  static List<Meals> getMealsData() {
    final List<Meals> meals = [
      Meals("assets/images/cake1.svg", "Breakfast", "120+ Foods"),
      Meals("assets/images/bread.svg", "Lunch", "130+ Foods"),
      Meals("assets/images/pancake.svg", "Dinner", "140+ Foods"),
    ];

    return meals;
  }
}
