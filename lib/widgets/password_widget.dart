import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/account_bloc/create_account_bloc.dart';
import '../blocs/account_bloc/create_account_event.dart';
import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/validator.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordWidget({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.borderColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
        buildWhen: (current, previous) => current.password != previous.password,
        builder: (context, state) {
          if (kDebugMode) {
            print("Password Widget");
          }
          return TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                labelText: AppString.password,
                counterText: "",
                labelStyle: const TextStyle(color: AppColor.grayColor2),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/lock.svg"),
                ),
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                  color: AppColor.grayColor1,
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
            obscureText: true,
            maxLength: 6,
            validator: (value) {
              return AppValidator.validatePassword(value);
            },
            onChanged: (value) {
              context.read<CreateAccountBloc>().add(PasswordChanged(value));
            },
          );
        },
      ),
    );
  }
}
