part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SelectGender extends SignUpEvent {
  final String gender;

  const SelectGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class SelectDateOfBirth extends SignUpEvent {
  final String dateOfBirth;

  const SelectDateOfBirth(this.dateOfBirth);

  @override
  List<Object?> get props => [dateOfBirth];
}

class SetWeight extends SignUpEvent {
  final String weight;

  const SetWeight(this.weight);

  @override
  List<Object?> get props => [weight];
}

class SetHeight extends SignUpEvent {
  final String height;

  const SetHeight(this.height);

  @override
  List<Object?> get props => [height];
}

class ValidateForm extends SignUpEvent {}
