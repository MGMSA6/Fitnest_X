class Sleep {
  final String imgPath;
  final String name;
  final String time;
  final String remainingHours;


  Sleep(this.imgPath, this.name, this.time, this.remainingHours);

  static List<Sleep> getSleepData() {
    final List<Sleep> meals = [
      Sleep("assets/images/bed.svg", "Bedtime", "09:00pm", "in 6hours 22minutes"),
      Sleep("assets/images/alarm.svg", "Alarm", "05:10am", "in 14hours 30minutes"),
    ];
    return meals;
  }

}
