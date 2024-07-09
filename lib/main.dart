import 'package:fitnest_x/blocs/account_bloc/create_account_bloc.dart';
import 'package:fitnest_x/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:fitnest_x/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/global_loader_bloc/global_loader_bloc.dart';
import 'blocs/login_bloc/login_bloc.dart';
import 'blocs/onboarding_bloc/onboarding_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FitnestX());
}

class FitnestX extends StatelessWidget {
  const FitnestX({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GlobalLoaderBloc()),
          BlocProvider(create: (context) => LoginBloc(AuthRepository())),
          BlocProvider(create: (context) => OnboardingBloc(4)),
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => CreateAccountBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(primarySwatch: Colors.deepPurple),
          darkTheme: ThemeData(brightness: Brightness.dark),
          initialRoute: RouteNames.signUp1,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
