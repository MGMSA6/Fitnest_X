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


  static List<WorkOutData> getWorkOutData1() {
    final List<WorkOutData> workOutData = [
      WorkOutData("Jan", 30),
      WorkOutData("Feb", 50),
      WorkOutData("Mar", 70),
      WorkOutData("Apr", 60),
      WorkOutData("May", 80),
      WorkOutData("Jun", 90),
      WorkOutData("Jul", 85),
    ];

    return workOutData;
  }
}
