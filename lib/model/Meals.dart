
class Meals {
  final String imgPath;
  final String name;
  final String deatils;

  Meals(this.imgPath, this.name, this.deatils);

  static List<Meals> getMealsData() {
    final List<Meals> meals = [
      Meals("assets/images/cake1.svg", "Breakfast", "120+ Foods"),
      Meals("assets/images/cake1.svg", "Lunch", "130+ Foods"),
      Meals("assets/images/cake1.svg", "Dinner", "140+ Foods"),
    ];

    return meals;
  }
}
