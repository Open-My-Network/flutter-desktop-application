part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInProgress extends SignInState {
  final bool isLoading;

  const SignInProgress({
    required this.isLoading,
  });

  @override
  List<Object> get props => [isLoading];
}

final class SignInSuccess extends SignInState {
  final bool isSuccess;

  const SignInSuccess({
    required this.isSuccess,
  });

  @override
  List<Object> get props => [isSuccess];
}
