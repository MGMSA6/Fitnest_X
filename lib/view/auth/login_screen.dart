import 'package:fitnest_x/model/enums/login_status.dart';
import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:fitnest_x/utils/utils.dart';
import 'package:fitnest_x/widgets/email_widget.dart';
import 'package:fitnest_x/widgets/password_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/login_bloc/login_bloc.dart';
import '../../utils/routes/route_names.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(AuthRepository());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final availableHeight = screenHeight - keyboardHeight;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (_) => _loginBloc,
          child: Stack(
            children: [
              Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              AppString.hey,
                              style: TextStyle(
                                  fontSize: 15, color: AppColor.blackColor),
                            ),
                            const Text(
                              AppString.welcome,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.blackColor),
                            ),
                            const SizedBox(height: 15),
                            EmailWidget(
                              emailController: _emailController,
                              onChanged: (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(EmailEvent(email: value));
                              },
                            ),
                            const SizedBox(height: 15),
                            PasswordWidget(
                                passwordController: _passwordController,
                                onChanged: (value) {
                                  context
                                      .read<LoginBloc>()
                                      .add(PasswordEvent(password: value));
                                }),
                            const SizedBox(height: 15),
                            const Text(
                              AppString.forgotPass,
                              style: TextStyle(
                                  fontSize: 12, color: AppColor.grayColor2),
                            ),
                          ],
                        ),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state.loginStatus == LoginStatus.ERR0R) {
                              Utils.flushBarErrorMessage(
                                  state.message, context);
                              if (kDebugMode) {
                                print(state.message);
                              }
                            } else if (state.loginStatus ==
                                LoginStatus.SUCCESS) {
                              Navigator.pushNamed(
                                  this.context, RouteNames.home);
                            }
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      gradient: AppColor.buttonColors,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(99),
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<LoginBloc>()
                                                .add(LoginApi());
                                          }
                                        },
                                        child: SizedBox(
                                          height: 60,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/login1.svg"),
                                              const SizedBox(width: 10),
                                              const Text(
                                                AppString.login,
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
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 1,
                                            color: AppColor.grayColor3,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            AppString.or,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColor.blackColor),
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
                                  const SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          onTap: () {},
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color:
                                                        AppColor.grayColor3)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color:
                                                        AppColor.grayColor3)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: SvgPicture.asset(
                                                  "assets/images/facebook.svg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        AppString.notAccount,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Material(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              this.context,
                                              RouteNames.signUp,
                                            );
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: const Text(
                                            AppString.register,
                                            style: TextStyle(
                                              color: AppColor.secondaryColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state.loginStatus == LoginStatus.LOADING) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
