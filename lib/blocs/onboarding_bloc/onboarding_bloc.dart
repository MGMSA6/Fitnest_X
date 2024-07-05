import 'package:bloc/bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int _currentStep = 0;
  final int _totalSteps;

  OnboardingBloc(this._totalSteps) : super(OnboardingInitial()) {
    on<OnboardingNext>(_onNext);
    on<OnboardingPrevious>(_onPrevious);
    on<OnboardingFinish>(_onFinish);
  }

  void _onNext(OnboardingNext event, Emitter<OnboardingState> emit) {
    if (_currentStep < _totalSteps - 1) {
      _currentStep++;
      emit(OnboardingStep(_currentStep));
    } else {
      emit(OnboardingComplete());
    }
  }

  void _onPrevious(OnboardingPrevious event, Emitter<OnboardingState> emit) {
    if (_currentStep > 0) {
      _currentStep--;
      emit(OnboardingStep(_currentStep));
    }
  }

  void _onFinish(OnboardingFinish event, Emitter<OnboardingState> emit) {
    emit(OnboardingComplete());
  }
}
