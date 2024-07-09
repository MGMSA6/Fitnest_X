import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnest_x/model/enums/login_status.dart';
import 'package:flutter/foundation.dart';

import '../../repository/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginState()) {
    on<EmailEvent>(_onEmail);
    on<PasswordEvent>(_onPassword);
    on<LoginApi>(_onLogin);
  }

  void _onEmail(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPassword(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLogin(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.LOADING));

    Map data = {'email': state.email, 'password': state.password};

    await _authRepository.login(data).then((onValue) {
      emit(state.copyWith(
          loginStatus: LoginStatus.SUCCESS, message: 'Login Successful'));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }
      emit(state.copyWith(
          loginStatus: LoginStatus.ERR0R, message: error.toString()));
    });
  }
}
