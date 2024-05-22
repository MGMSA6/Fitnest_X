import 'package:fitnest_x/model/Meals.dart';

class MealSet {
  final String mealType;
  final String calories;
  final List<Meals> meals;

  MealSet(this.mealType, this.calories, this.meals);

  static List<MealSet> getMealSetData() {
    final List<MealSet> mealSet = [
      MealSet("Breakfast", "2 meals | 230 calories", getBreakfast()),
      MealSet("Lunch", "2 meals | 500 calories", getLunch()),
      MealSet("Snacks", "2 meals | 140 calories", getSnacks()),
      MealSet("Dinner", "2 meals | 120 calories", getDinner()),
    ];
    return mealSet;
  }

  static List<Meals> getBreakfast() {
    final List<Meals> meals = [
      Meals("assets/images/pancake.svg", "Honey Pancake", "07:00am"),
      Meals("assets/images/coffee.svg", "Coffee", "07:30am"),
    ];
    return meals;
  }

  static List<Meals> getLunch() {
    final List<Meals> meals = [
      Meals("assets/images/chicken.svg", "Chicken Steak", "01:00pm"),
      Meals("assets/images/glass_of_milk.svg", "Milk", "01:20pm"),
    ];
    return meals;
  }

  static List<Meals> getSnacks() {
    final List<Meals> meals = [
      Meals("assets/images/orange.svg", "Orange", "04:30pm"),
      Meals("assets/images/apple_pie.svg", "Apple Pie", "04:40pm"),
    ];
    return meals;
  }

  static List<Meals> getDinner() {
    final List<Meals> meals = [
      Meals("assets/images/salad1.svg", "Salad", "07:10pm"),
      Meals("assets/images/oatmeal.svg", "Oatmeal", "08:10pm"),
    ];
    return meals;
  }
}
