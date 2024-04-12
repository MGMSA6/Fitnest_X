class WorkOutData {
  final String weekDay;
  final int percentage;

  WorkOutData(this.weekDay, this.percentage);

  static List<WorkOutData> getWorkOutData() {
    final List<WorkOutData> workOutData = [
      WorkOutData("Sun", 30),
      WorkOutData("Mon", 50),
      WorkOutData("Tue", 70),
      WorkOutData("Wen", 60),
      WorkOutData("Thu", 80),
      WorkOutData("Fri", 90),
      WorkOutData("Sat", 85),
    ];

    return workOutData;
  }
}
