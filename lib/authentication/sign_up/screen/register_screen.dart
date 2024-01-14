import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../app/widgets/custom_text_field.dart';
import '../../sign_in/screen/login_screen.dart';
import '../bloc/sign_up_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController email = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SignUpLoding && state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SignUpSuccess && state.isSuccess == true) {
              return const LoginScreen();
            }
            return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: username,
                      labelText: "Username",
                      hintText: "Enter username",
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                        return "";
                      },
                      prefixIconData: Icons.person,
                    ),
                    const Gap(10 * 2),
                    CustomTextField(
                      controller: email,
                      labelText: "Email",
                      hintText: "Enter email address",
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return "email address is required";
                        }
                        return "";
                      },
                      prefixIconData: Icons.mail,
                    ),
                    const Gap(10 * 2),
                    CustomTextField(
                      isObscure: true,
                      controller: password,
                      labelText: "Password",
                      hintText: "Enter password",
                      onValidate: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return "";
                      },
                      prefixIconData: Icons.security,
                    ),
                    const Gap(10 * 2),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpUserEvent(
                            username: username.text,
                            password: password.text,
                            email: email.text,
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
