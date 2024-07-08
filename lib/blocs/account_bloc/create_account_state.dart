part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const CreateAccountState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
  });

  CreateAccountState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return CreateAccountState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}

class CreateAccountInitial extends CreateAccountState {}
