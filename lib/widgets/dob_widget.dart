import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../res/colors.dart';
import '../res/strings.dart';
import '../utils/validator.dart';

class DobWidget extends StatelessWidget {
  DobWidget({super.key});

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.borderColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (current, previous) => current.dob != previous.dob,
        builder: (context, state) {
          if (kDebugMode) {
            print('Dob widget');
          }
          return TextFormField(
            readOnly: true,
            decoration: InputDecoration(
                labelText: AppString.dob,
                labelStyle: const TextStyle(color: AppColor.grayColor2),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/images/calendar.svg",
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
            onTap: () {
              _selectDate(context);
            },
            onChanged: (value) {
              context.read<SignUpBloc>().add(SelectDateOfBirth(value));
            },
            controller: _dateController,
            validator: (value) {
              return AppValidator.validateDob(value);
            },
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
      context.read<SignUpBloc>().add(SelectDateOfBirth(_dateController.text));
    }
  }
}
