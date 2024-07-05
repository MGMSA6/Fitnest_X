import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingStep extends OnboardingState {
  final int step;

  const OnboardingStep(this.step);

  @override
  List<Object> get props => [step];
}

class OnboardingComplete extends OnboardingState {}
