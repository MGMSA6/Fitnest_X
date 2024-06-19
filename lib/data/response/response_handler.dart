import 'dart:convert';

import 'package:fitnest_x/data/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ResponseHandler {
  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error Occurred during communicating with server With Status Code: ${response.statusCode}");
    }
  }
}
