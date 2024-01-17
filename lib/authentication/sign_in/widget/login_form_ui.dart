import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:open_my_network_app/app/widgets/custom_text_field.dart';
import 'package:open_my_network_app/authentication/sign_up/screen/register_screen.dart';

import '../bloc/sign_in_bloc.dart';

class LoginFormUI extends StatelessWidget {
  const LoginFormUI({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              controller: password,
              isObscure: true,
              labelText: "Password",
              hintText: "Enter password",
              onValidate: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 8) {
                  return "More than 8 character";
                }
                return "";
              },
              prefixIconData: Icons.security,
            ),
            const Gap(10 * 2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 0, 76, 232),
                            shadowColor: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 1,
                                40),), //////// HERE
              onPressed: () {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInUserEvent(
                    username: username.text,
                    password: password.text,
                  ),
                );
              },
              child: const Text(
                "Login",
              ),
            ),
            const Gap(10 * 2),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: "Do not have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                    text: "Register",
                    style: TextStyle(color:Color.fromARGB(255, 0, 76, 232)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  RegisterScreen()));
                      }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
