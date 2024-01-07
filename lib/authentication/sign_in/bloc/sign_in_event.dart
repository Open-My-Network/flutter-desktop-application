part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInUserEvent extends SignInEvent {
  final String username;
  final String password;

  const SignInUserEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class SignInUserLogout extends SignInEvent {}
