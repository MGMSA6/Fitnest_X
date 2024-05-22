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

  static List<Meals> getMealsData1() {
    final List<Meals> meals = [
      Meals("assets/images/salad.svg", "Salad", ""),
      Meals("assets/images/pancake.svg", "Cake", ""),
      Meals("assets/images/cake1.svg", "Pie", ""),
      Meals("assets/images/orange.svg", "Smoothies", ""),
    ];
    return meals;
  }

  static List<Meals> getMealsData2() {
    final List<Meals> meals = [
      Meals("assets/images/pancake.svg", "Honey Pancake",
          "Easy | 30mins | 180kCal"),
      Meals(
          "assets/images/bread.svg", "Canai Bread", "Easy | 20mins | 230kCal"),
      Meals("assets/images/pancake3.svg", "Blueberry Pancake",
          "Easy | 20mins | 230kCal"),
      Meals("assets/images/cake1.svg", "Blueberry Pancake",
          "Easy | 20mins | 230kCal"),
    ];
    return meals;
  }

  static List<Meals> getPopularMealsData() {
    final List<Meals> meals = [
      Meals("assets/images/pancake2.svg", "Blueberry Pancake",
          "Medium | 30mins | 230kCal"),
      Meals("assets/images/nigiri.svg", "Salmon Nigiri",
          "Medium | 20mins | 120kCal"),
    ];
    return meals;
  }

  static List<Meals> getNutrition() {
    final List<Meals> meals = [
      Meals("assets/images/calories.svg", "Blueberry Pancake", "180kCal"),
      Meals("assets/images/eggs.svg", "Salmon Nigiri", "30g fats"),
      Meals("assets/images/protein.svg", "Salmon Nigiri", "20g proteins"),
      Meals("assets/images/carbo.svg", "Salmon Nigiri", "50g carbo"),
    ];
    return meals;
  }

  static List<Meals> getIngredients() {
    final List<Meals> meals = [
      Meals("assets/images/flour.svg", "Wheat Flour", "100gr"),
      Meals("assets/images/sugar.svg", "Sugar", "3 tbsp"),
      Meals("assets/images/baking_soda.svg", "Baking Soda", "2 tsp"),
      Meals("assets/images/brown_eggs.svg", "Eggs", "2 items"),
    ];
    return meals;
  }

  static List<Meals> getTodayMeal() {
    final List<Meals> meals = [
      Meals("assets/images/calories.svg", "Calories", "320 kCal"),
      Meals("assets/images/protein.svg", "Proteins", "300g"),
      Meals("assets/images/eggs.svg", "Fats", "140g"),
      Meals("assets/images/carbo.svg", "Carbo", "140g"),
    ];
    return meals;
  }
}
