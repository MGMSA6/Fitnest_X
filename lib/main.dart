import 'package:fitnest_x/repository/auth_repository.dart';
import 'package:fitnest_x/utils/routes/route_names.dart';
import 'package:fitnest_x/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/global_loader_bloc/global_loader_bloc.dart';
import 'blocs/login_bloc/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FitnestX());
}

class FitnestX extends StatelessWidget {
  const FitnestX({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => GlobalLoaderBloc()),
      BlocProvider(create: (context) => LoginBloc(AuthRepository())),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: RouteNames.welcome,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}
