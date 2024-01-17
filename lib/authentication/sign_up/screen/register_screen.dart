import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:open_my_network_app/app/widgets/text_widget.dart';

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/auth/login_banner.jpg",
                            ))),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 20, bottom: 20),
                  child: AppText(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 76, 232),
                    isSelectableText: false,
                    strText: "Register your account",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .7,
                    child: AppText(
                      isSelectableText: false,
                      strText:
                          "Please register your account by entering your username email address here.",
                    ),
                  ),
                ),
                Container(
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
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 0, 76, 232),
                            shadowColor: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * .9,
                                40), //////// HERE
                          ),
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpUserEvent(
                                username: username.text,
                                password: password.text,
                                email: email.text,
                              ),
                            );
                          },
                          child: Text('REGISTER'),
                        ),
                        // const Gap(10 * 2),
                      ],
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left:40.0,bottom:36),
                   child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: "Already have an account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              const WidgetSpan(child: SizedBox(width: 5)),
                              TextSpan(
                                  text: "Login",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 76, 232)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    }),
                            ]),
                          ),
                 ),
              ],
            );
          },
        ),
      ),
    );
  }
}
