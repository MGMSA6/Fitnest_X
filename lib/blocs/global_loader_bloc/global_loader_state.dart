part of 'global_loader_bloc.dart';

class GlobalLoaderState extends Equatable {
  final bool isLoading;

  const GlobalLoaderState({required this.isLoading});

  GlobalLoaderState copyWith({bool? isLoading}) {
    return GlobalLoaderState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
