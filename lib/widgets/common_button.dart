import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/routes/route_names.dart';

class CommonButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isChecked;

  const CommonButton(
      {super.key, required this.isChecked, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: AppColor.buttonColors,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes the position of the shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(99),
          onTap: () {
            if (formKey.currentState!.validate()) {
              if (isChecked) {
                Navigator.pushNamed(
                  context,
                  RouteNames.login,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(AppString.terms),
                ));
              }
            }
          },
          child: const SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.register,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
