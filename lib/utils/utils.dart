import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static double averageRating(List<int> ratings) {
    var avgRating = 0;
    for (int i = 0; i < ratings.length; i++) {
      avgRating = avgRating + ratings[i];
    }

    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    if (message == null || message.isEmpty) {
      message = "An error occurred."; // Default message
    }

    showFlushbar(
        context: context,
        flushbar: Flushbar(
            forwardAnimationCurve: Curves.decelerate,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(15),
            message: message,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            reverseAnimationCurve: Curves.easeInOut,
            positionOffset: 20,
            icon: Icon(
              Icons.error,
              size: 20,
              color: Colors.white,
            ))
          ..show(context));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: Colors.black));
  }

  static void fieldFocusNode(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
