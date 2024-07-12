import 'dart:convert';

import 'package:fitnest_x/core/service_locator.dart';
import 'package:fitnest_x/model/user_model.dart';
import 'package:fitnest_x/utils/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  bool? isLogin;
  UserModel userModel = getIt();

  SessionController._internal() {
    isLogin = false;
  }

  final LocalStorage localStorage = LocalStorage();

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    // Storing value to check login
    localStorage.setValue('isLogin', isLogin);
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.raedValue('token');
      var isLogin = await localStorage.raedValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController().userModel =
            UserModel.fromJson(jsonDecode(userData));
      }

      SessionController().isLogin = isLogin == true ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
