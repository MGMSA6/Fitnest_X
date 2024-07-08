import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'create_account_event.dart';

part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(CreateAccountInitial()) {
    on<FirstNameChanged>(_fistName);
    on<LastNameChanged>(_lastName);
    on<EmailChanged>(_email);
    on<PasswordChanged>(_password);
  }

  void _fistName(FirstNameChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _lastName(LastNameChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _email(EmailChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _password(PasswordChanged event, Emitter<CreateAccountState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
