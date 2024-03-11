import 'package:fitnest_x/pages/Finalized.dart';
import 'package:fitnest_x/pages/Welcome.dart';
import 'package:fitnest_x/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(fontSize: 15, color: AppColor.blackColor),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColor.borderColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: AppColor.grayColor2),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/images/email.svg",
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
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
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
                  Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: AppColor.grayColor2),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Column(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Finalized()));
                            },
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/login1.svg"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Login",
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
                            "Don't have an account yet? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Material(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(8),
                              child: const Text("Register",
                                  style: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
