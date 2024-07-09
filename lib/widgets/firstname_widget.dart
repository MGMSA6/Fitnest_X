import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/account_bloc/create_account_bloc.dart';
import '../blocs/account_bloc/create_account_event.dart';
import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/validator.dart';

class FirstnameWidget extends StatelessWidget {

  final TextEditingController firstNameController;

  const FirstnameWidget({super.key, required this.firstNameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.borderColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
        buildWhen: (current, previous) => current.firstName != previous.firstName,
        builder: (context, state) {
          if (kDebugMode) {
            print("FirstName Widget");
          }
          return TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(
                labelText: AppString.first_name,
                counterText: "",
                labelStyle: const TextStyle(color: AppColor.grayColor2),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/images/profile.svg",
                  ),
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
            maxLength: 12,
            validator: (value) {
              return AppValidator.validateFirstName(value);
            },
            onChanged: (value) {
              context.read<CreateAccountBloc>().add(FirstNameChanged(value));
            },
          );
        },
      ),
    );
  }
}
