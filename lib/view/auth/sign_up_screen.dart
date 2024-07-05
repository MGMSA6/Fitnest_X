import 'package:fitnest_x/res/strings.dart';
import 'package:fitnest_x/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../res/colors.dart';
import '../../utils/routes/route_names.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  String? _selectedGender = AppString.male;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Parent widget build');
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/images/login.svg",
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Adjust the spacing between image and text
                  const Text(
                    AppString.completeProfile,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor),
                  ),
                  const Text(
                    AppString.completeProfileDesc,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grayColor1),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildGenderDropdown(context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDateOfBirthField(context),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildWeightField(context),
                  SizedBox(
                    height: 15,
                  ),
                  _buildHeightField(context),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          gradient: AppColor.buttonColors,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 4), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(99),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.signUp1,
                                );
                              }
                            },
                            child: const SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppString.next,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    // Adjust the color as needed
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown(BuildContext context) {
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
                // setState(() {
                //   _selectedGender = value;
                // });
                context.read<SignUpBloc>().add(SelectGender(value!));
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateOfBirthField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.borderColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.dob != current.dob,
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
              _selectDate();
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

  Widget _buildWeightField(BuildContext context) {
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

  Widget _buildHeightField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
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
                    current.height != previous.height,
                builder: (context, state) {
                  if (kDebugMode) {
                    print('Height widget');
                  }
                  return TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3)
                    ],
                    decoration: InputDecoration(
                        labelText: AppString.height,
                        labelStyle: const TextStyle(color: AppColor.grayColor2),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/images/swap.svg",
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
                      context.read<SignUpBloc>().add(SetHeight(value));
                    },
                    validator: (value) {
                      return AppValidator.validateHeight(value);
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
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: AppColor.unitGradient,
              ),
              child: const Center(
                child: Text(
                  AppString.CM,
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

  Future<void> _selectDate() async {
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

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
