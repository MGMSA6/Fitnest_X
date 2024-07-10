import 'package:fitnest_x/utils/auth.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:fitnest_x/widgets/common_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../blocs/account_bloc/create_account_bloc.dart';
import '../../blocs/account_bloc/create_account_event.dart';
import '../../utils/routes/route_names.dart';
import '../../widgets/widgets.dart';

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
    if (kDebugMode) {
      print("Root Widget");
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
                      FirstnameWidget(
                        firstNameController: _firstNameController,
                      ),
                      const SizedBox(
                        width: 20,
                        height: 15,
                      ),
                      LastnameWidget(lastNameController: _lastNameController),
                      const SizedBox(
                        height: 15,
                      ),
                      EmailWidget(
                        emailController: _emailController,
                        onChanged: (value) {
                          context
                              .read<CreateAccountBloc>()
                              .add(EmailChanged(value));
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PasswordWidget(
                        passwordController: _passwordController,
                        onChanged: (value) {
                          context
                              .read<CreateAccountBloc>()
                              .add(PasswordChanged(value));
                        },
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
                                    WidgetStateProperty.resolveWith((states) {
                                  if (states.contains(WidgetState.selected)) {
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
                      CommonButton(isChecked: isChecked, formKey: _formKey),
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
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.login,
                                );
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
