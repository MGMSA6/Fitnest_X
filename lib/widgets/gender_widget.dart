import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../res/colors.dart';
import '../res/strings.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.borderColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          buildWhen: (current, previous) => current.gender != previous.gender,
          builder: (context, state) {
            if (kDebugMode) {
              print('Gender Widget');
            }
            return DropdownButtonFormField<String>(
              value: state.gender,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              iconEnabledColor: AppColor.grayColor2,
              iconSize: 23,
              borderRadius: BorderRadius.zero,
              decoration: InputDecoration(
                  label: const Text(AppString.chooseGender),
                  labelStyle: const TextStyle(color: AppColor.grayColor2),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/images/user.svg",
                      width: 18,
                      height: 18,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
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
              items: [AppString.male, AppString.female, AppString.other]
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (String? value) {
                // Handle dropdown value change
                context.read<SignUpBloc>().add(SelectGender(value!));
              },
            );
          },
        ),
      ),
    );
  }
}
