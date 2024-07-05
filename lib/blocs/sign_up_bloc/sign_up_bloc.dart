import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../res/strings.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SelectGender>(_gender);
    on<SelectDateOfBirth>(_dob);
    on<SetHeight>(_height);
    on<SetWeight>(_weight);
    on<ValidateForm>(_validateForm);

  }

  void _gender(SelectGender event, Emitter<SignUpState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  void _dob(SelectDateOfBirth event, Emitter<SignUpState> emit) {
    emit(state.copyWith(dob: event.dateOfBirth));
  }

  void _height(SetHeight event, Emitter<SignUpState> emit) {
    emit(state.copyWith(height: event.height));
  }

  void _weight(SetWeight event, Emitter<SignUpState> emit) {
    emit(state.copyWith(weight: event.weight));
  }

  void _validateForm(ValidateForm event, Emitter<SignUpState> emit) {
    final isFormValid = state.gender != null &&
        state.dob != null &&
        state.height != null &&
        state.weight != null;
    emit(state.copyWith(isFormValid: isFormValid));
  }
}
