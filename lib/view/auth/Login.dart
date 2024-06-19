import 'package:fitnest_x/model/enums/login_status.dart';
import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:fitnest_x/res/colors.dart';
import 'package:fitnest_x/res/strings.dart';
import 'package:fitnest_x/utils/utils.dart';
import 'package:fitnest_x/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/global_loader_bloc/global_loader_bloc.dart';
import '../../blocs/login_bloc/login_bloc.dart';
import '../../utils/components/global_loader_widget.dart';
import '../../utils/routes/route_names.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;
  late GlobalLoaderBloc _globalLoaderBloc;

  @override
  void initState() {
    super.initState();
    _globalLoaderBloc = GlobalLoaderBloc();
    _loginBloc = LoginBloc(AuthRepository(), _globalLoaderBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _globalLoaderBloc),
        BlocProvider(create: (_) => _loginBloc),
      ],
      child: GlobalLoaderWidget(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SingleChildScrollView(
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
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: AppColor.borderColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                buildWhen: (current, previous) =>
                                    current.email != previous.email,
                                builder: (context, state) {
                                  return TextFormField(
                                    maxLength: 25,
                                    decoration: InputDecoration(
                                        counterText: "",
                                        labelText: AppString.email,
                                        labelStyle: const TextStyle(
                                            color: AppColor.grayColor2),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            "assets/images/email.svg",
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        )),
                                    onChanged: (value) {
                                      context
                                          .read<LoginBloc>()
                                          .add(EmailEvent(email: value));
                                    },
                                    validator: (value) {
                                      return AppValidator.validateEmail(value);
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: AppColor.borderColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: BlocBuilder<LoginBloc, LoginState>(
                                buildWhen: (current, previous) =>
                                    current.password != previous.password,
                                builder: (context, state) {
                                  return TextFormField(
                                    maxLength: 10,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        counterText: "",
                                        labelText: AppString.password,
                                        labelStyle: const TextStyle(
                                            color: AppColor.grayColor2),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                              "assets/images/lock.svg"),
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.visibility_off_outlined,
                                          color: AppColor.grayColor1,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        )),
                                    onChanged: (value) {
                                      context
                                          .read<LoginBloc>()
                                          .add(PasswordEvent(password: value));
                                    },
                                    validator: (value) {
                                      return AppValidator.validatePassword(
                                          value);
                                    },
                                  );
                                },
                              ),
                            ),
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
                            if (state.loginStatus == LoginStatus.SUCCESS) {
                              Navigator.pushNamed(
                                context,
                                RouteNames.home,
                              );
                            } else if (state.loginStatus == LoginStatus.ERR0R) {
                              Utils.flushBarErrorMessage(
                                  state.message, context);
                              if (kDebugMode) {
                                print(state.message);
                              }
                            }
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<LoginBloc>().add(LoginApi());
                                  }
                                },
                                child: const Text('Login'),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                AppString.notAccount,
                                style: TextStyle(
                                    fontSize: 12, color: AppColor.grayColor2),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.signUp,
                                  );
                                },
                                child: const Text('Sign Up'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
