part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final String username;
  final String password;
  final String email;

  const SignUpUserEvent({
    required this.username,
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [username, email, password];
}
