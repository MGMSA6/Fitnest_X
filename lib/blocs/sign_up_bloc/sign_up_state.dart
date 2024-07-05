part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String gender;
  final String dob;
  final String weight;
  final String height;
  final bool isFormValid;

  const SignUpState(
      {this.gender = AppString.male,
      this.dob = '',
      this.weight = '',
      this.height = '',
      this.isFormValid = false});

  SignUpState copyWith(
      {String? gender,
      String? dob,
      String? weight,
      String? height,
      bool? isFormValid}) {
    return SignUpState(
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [gender, dob, weight, height, isFormValid];
}

class SignUpInitial extends SignUpState {}
