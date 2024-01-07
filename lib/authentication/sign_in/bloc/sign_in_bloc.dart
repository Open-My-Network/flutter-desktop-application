import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/sign_in_helper.dart';
import '../service/sign_in_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    SignInService signInService = SignInService();
    on<SignInUserEvent>((event, emit) async {
      final String username = event.username;
      final String password = event.password;

      emit(const SignInProgress(isLoading: true));
      final bool userStatue = await signInService.loginUser(username, password);
      await currentUserStatus();

      emit(const SignInProgress(isLoading: false));
      emit(SignInSuccess(isSuccess: userStatue));
    });

    on<SignInUserLogout>((event, emit) async {
      await logoutUserStatus();
      emit(SignInInitial());
    });
  }
}
