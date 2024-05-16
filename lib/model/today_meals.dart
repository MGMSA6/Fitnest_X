class TodayMeals {
  final String imgPath;
  final String name;
  String details;
  String notifyImgPath;
  bool isNotify = false;

  TodayMeals(
      this.imgPath, this.name, this.details, this.notifyImgPath, this.isNotify);

  static List<TodayMeals> getTodayMealsData() {
    final List<TodayMeals> todayMeals = [
      TodayMeals("assets/images/nigiri.svg", "Salmon Nigiri", "Today | 7am",
          "assets/images/reminders.svg", false),
      TodayMeals("assets/images/glass_of_milk.svg", "Lowfat Milk",
          "Today | 8am", "assets/images/un_reminder.svg", false),
    ];

    return todayMeals;
  }
}
