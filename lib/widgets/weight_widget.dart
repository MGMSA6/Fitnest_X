import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/validator.dart';

class WeightWidget extends StatelessWidget {
  const WeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 8, // 80% space for TextField
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.borderColor,
                  borderRadius: BorderRadius.circular(14)),
              child: BlocBuilder<SignUpBloc, SignUpState>(
                buildWhen: (current, previous) =>
                    current.weight != previous.weight,
                builder: (context, state) {
                  if (kDebugMode) {
                    print('Weight widget');
                  }
                  return TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3)
                    ],
                    decoration: InputDecoration(
                        labelText: AppString.weight,
                        labelStyle: const TextStyle(color: AppColor.grayColor2),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/images/weight_scale.svg",
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0),
                        )),
                    onChanged: (value) {
                      context.read<SignUpBloc>().add(SetWeight(value));
                    },
                    validator: (value) {
                      return AppValidator.validateWeight(value);
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Space between TextField and Container
          Expanded(
            flex: 2, // 20% space for Container
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: AppColor.unitGradient,
              ),
              child: const Center(
                child: Text(
                  AppString.KG,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
