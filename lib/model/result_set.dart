import 'package:fitnest_x/model/result_data.dart';

class ResultSet {
  final String bodyPart;
  final List<ResultData> resultData;

  ResultSet(this.bodyPart, this.resultData);

  static List<ResultSet> getResultData() {
    final List<ResultSet> resultSet = [
      ResultSet("Front Facing", ResultData.getResultData1()),
      ResultSet("Back Facing", ResultData.getResultData2()),
      ResultSet("Left Facing", ResultData.getResultData3()),
      ResultSet("Right Facing", ResultData.getResultData4()),
    ];
    return resultSet;
  }
}
