part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoding extends SignUpState {
  final bool isLoading;

  const SignUpLoding({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class SignUpSuccess extends SignUpState {
  final bool isSuccess;

  const SignUpSuccess({required this.isSuccess});

  @override
  List<Object> get props => [isSuccess];
}
