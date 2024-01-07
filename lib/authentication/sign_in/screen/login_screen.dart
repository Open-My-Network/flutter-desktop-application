import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/main/screen/main_screen.dart';

import '../../../app/widgets/text_widget.dart';
import '../bloc/sign_in_bloc.dart';
import '../widget/login_form_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SignInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SignInSuccess && state.isSuccess == true) {
              return const MainScreen();
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
                      ),
                    ),
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AppText(
                    isSelectableText: false,
                    strText: "Welcome to Open My Network",
                  ),
                ),
                const LoginFormUI(),
              ],
            );
          },
        ),
      ),
    );
  }
}
