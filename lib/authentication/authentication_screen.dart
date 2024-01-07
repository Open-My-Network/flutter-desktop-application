import 'package:flutter/material.dart';

import '../main/screen/main_screen.dart';
import 'sign_in/screen/login_screen.dart';
import 'sign_in/service/sign_in_helper.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getcurrentUserStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return const MainScreen();
          }
          if (snapshot.hasData && snapshot.data == false) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
