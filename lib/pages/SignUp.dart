import 'package:fitnest_x/pages/Login.dart';
import 'package:fitnest_x/utils/strings.dart';
import 'package:fitnest_x/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import 'Signup1.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  String? _selectedGender = AppString.male;
  String? _dob;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: FittedBox(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        "assets/images/login.svg",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Adjust the spacing between image and text
                  Text(
                    AppString.completeProfile,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor),
                  ),
                  Text(
                    AppString.completeProfileDesc,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grayColor1),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.borderColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        iconEnabledColor: AppColor.grayColor2,
                        iconSize: 23,
                        borderRadius: BorderRadius.zero,
                        decoration: InputDecoration(
                            label: const Text(AppString.chooseGender),
                            labelStyle:
                                const TextStyle(color: AppColor.grayColor2),
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
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 0),
                            )),
                        items:
                            [AppString.male, AppString.female, AppString.other]
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                        onChanged: (String? value) {
                          // Handle dropdown value change
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColor.borderColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: AppString.dob,
                          labelStyle:
                              const TextStyle(color: AppColor.grayColor2),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/images/calendar.svg",
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
                      onTap: () {
                        _selectDate();
                      },
                      controller: _dateController,
                      validator: (value) {
                        return AppValidator.validateDob(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8, // 80% space for TextField
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.borderColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3)
                              ],
                              decoration: InputDecoration(
                                  labelText: AppString.weight,
                                  labelStyle:
                                      TextStyle(color: AppColor.grayColor2),
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
                              validator: (value) {
                                return AppValidator.validateWeight(value);
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8, // 80% space for TextField
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.borderColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3)
                              ],
                              decoration: InputDecoration(
                                  labelText: AppString.height,
                                  labelStyle: const TextStyle(
                                      color: AppColor.grayColor2),
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
                              validator: (value) {
                                return AppValidator.validateHeight(value);
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
                  ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup1()));
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
