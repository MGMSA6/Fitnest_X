class ResultData {
  final String imgPath1;
  final String imgPath2;

  ResultData(this.imgPath1, this.imgPath2);

  static List<ResultData> getResultData1() {
    final List<ResultData> result = [
      ResultData(
          "assets/images/arm_raises.png", "assets/images/cobra_stretch.png"),
    ];
    return result;
  }

  static List<ResultData> getResultData2() {
    final List<ResultData> result = [
      ResultData(
          "assets/images/jumping_jack.png", "assets/images/push_ups.png"),
    ];
    return result;
  }

  static List<ResultData> getResultData3() {
    final List<ResultData> result = [
      ResultData("assets/images/skipping.png", "assets/images/squats.png"),
    ];
    return result;
  }

  static List<ResultData> getResultData4() {
    final List<ResultData> result = [
      ResultData("assets/images/warm_up.png", "assets/images/rest_drink.png"),
    ];
    return result;
  }
}
