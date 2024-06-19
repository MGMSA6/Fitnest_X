part of 'global_loader_bloc.dart';

abstract class GlobalLoaderEvent extends Equatable {
  const GlobalLoaderEvent();

  @override
  List<Object> get props => [];
}

class ShowLoader extends GlobalLoaderEvent {}

class HideLoader extends GlobalLoaderEvent {}
