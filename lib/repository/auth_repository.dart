import 'package:fitnest_x/app_urls.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiServices.onLogin(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
