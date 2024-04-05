import 'package:fitnest_x/pages/auth/Login.dart';
import 'package:fitnest_x/utils/auth.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:fitnest_x/utils/strings.dart';
import 'package:fitnest_x/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SignUp.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup1> {
  bool isChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        AppString.hey_there_title,
                        style:
                            TextStyle(fontSize: 15, color: AppColor.blackColor),
                      ),
                      const Text(
                        AppString.create_account_title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColor.blackColor),
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
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              labelText: AppString.first_name,
                              counterText: "",
                              labelStyle:
                                  const TextStyle(color: AppColor.grayColor2),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/images/profile.svg",
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
                          maxLength: 12,
                          validator: (value) {
                            return AppValidator.validateFirstName(value);
                          },
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColor.borderColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              labelText: AppString.last_name,
                              counterText: "",
                              labelStyle:
                                  const TextStyle(color: AppColor.grayColor2),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/images/profile.svg",
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
                          maxLength: 15,
                          validator: (value) {
                            return AppValidator.validateLastName(value);
                          },
                          onTap: () {},
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: AppString.email,
                              counterText: "",
                              // Handle null value
                              labelStyle:
                                  const TextStyle(color: AppColor.grayColor2),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    SvgPicture.asset("assets/images/email.svg"),
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
                          maxLength: 25,
                          validator: (value) {
                            return AppValidator.validateEmail(value);
                          },
                          onTap: () {},
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: AppString.password,
                              counterText: "",
                              labelStyle:
                                  const TextStyle(color: AppColor.grayColor2),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    SvgPicture.asset("assets/images/lock.svg"),
                              ),
                              suffixIcon: const Icon(
                                Icons.visibility_off_outlined,
                                color: AppColor.grayColor1,
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
                          obscureText: true,
                          maxLength: 6,
                          validator: (value) {
                            return AppValidator.validatePassword(value);
                          },
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.black;
                                  }
                                  return null;
                                }),
                                checkColor: Colors.white,
                                side: const BorderSide(
                                    color: AppColor.grayColor2),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            const Text(
                              AppString.privacy_policy_message,
                              style: TextStyle(
                                  color: AppColor.grayColor2, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                if (isChecked) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Please accept the terms and conditions"),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColor.grayColor3,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                AppString.or,
                                style: TextStyle(
                                    fontSize: 12, color: AppColor.blackColor),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColor.grayColor3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                AuthMethods().signInWithGoogle(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: AppColor.grayColor3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                      "assets/images/google1.svg"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                AuthMethods().signInWithGoogle(context);
                              },
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: AppColor.grayColor3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    "assets/images/apple.svg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            AppString.haveAccount,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: const Text(AppString.login,
                                  style: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
