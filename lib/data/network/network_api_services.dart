import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:fitnest_x/data/network/base_api_services.dart';

import '../../utils/internet_checker.dart';
import '../app_exceptions.dart';
import '../response/response_handler.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future onLogin(String url, body) async {
    dynamic jsonResponse;
    try {
      if (await InternetChecker.isInternetAvailable()) {
        final getResponse =
            await http.get(Uri.parse(url));
        jsonResponse = ResponseHandler.returnResponse(getResponse);
      } else {
        throw FetchDataException("No Internet Connection");
      }
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }
}
