import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/account_bloc/create_account_bloc.dart';
import '../blocs/account_bloc/create_account_event.dart';
import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/validator.dart';

class EmailWidget extends StatelessWidget {
  final TextEditingController emailController;

  const EmailWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.borderColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
        buildWhen: (current, previous) => current.email != previous.email,
        builder: (context, state) {
          if (kDebugMode) {
            print("Email Widget");
          }
          return TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: AppString.email,
                counterText: "",
                // Handle null value
                labelStyle: const TextStyle(color: AppColor.grayColor2),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/email.svg"),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                )),
            maxLength: 25,
            validator: (value) {
              return AppValidator.validateEmail(value);
            },
            onChanged: (value) {
              context.read<CreateAccountBloc>().add(EmailChanged(value));
            },
          );
        },
      ),
    );
  }
}
