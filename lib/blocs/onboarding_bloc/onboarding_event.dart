
import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingNext extends OnboardingEvent {}

class OnboardingPrevious extends OnboardingEvent {}

class OnboardingFinish extends OnboardingEvent {}
