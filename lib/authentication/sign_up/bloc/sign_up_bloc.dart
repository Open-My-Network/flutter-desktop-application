import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/sign_up_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpUserEvent>((event, emit) async {
      final String username = event.username;
      final String email = event.email;
      final String password = event.password;

      SignUpService signUpService = SignUpService();
      emit(const SignUpLoding(isLoading: true));
      final bool userStatus =
          await signUpService.registerUser(username, email, password);

      emit(const SignUpLoding(isLoading: false));
      emit(SignUpSuccess(isSuccess: userStatus));
    });
  }
}
