import 'package:fitnest_x/pages/SignUp1.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;

  final TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  String _errorText = "Invalid Email";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Hey there,",
                      style:
                          TextStyle(fontSize: 15, color: AppColor.blackColor),
                    ),
                    const Text(
                      "Create an Account",
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
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "First Name",
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
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Last Name",
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
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            errorText: _errorText,
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
                        onTap: () {},
                        onChanged: (value) {
                          setState(() {
                            if (_emailRegExp.hasMatch(value)) {
                              _errorText = "";
                            } else {
                              _errorText = 'Enter a valid email';
                            }
                          });
                        },
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
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                const TextStyle(color: AppColor.grayColor2),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset("assets/images/lock.svg"),
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
                              side: BorderSide(color: AppColor.grayColor2),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text(
                            "By continuing you accept our Privacy Policy\nand Term of Use",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp1()));
                          },
                          child: const SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Register",
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
                              "Or",
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
                            onTap: () {},
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
                            onTap: () {},
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: AppColor.grayColor3)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  "assets/images/facebook.svg",
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
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8),
                            child: const Text("Login",
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
