import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/authentication/authentication_screen.dart';
import 'package:open_my_network_app/authentication/sign_in/bloc/sign_in_bloc.dart';

import '../../app/style/cubit/theme_cubit.dart';

PreferredSizeWidget mainAppBarWidget(BuildContext context, String? title) {
  return AppBar(
    title: Text(title ?? "Open My Network"),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context, listen: false).changeTheme();
        },
        icon: const Icon(Icons.dark_mode),
      ),
      IconButton(
        onPressed: () {
          BlocProvider.of<SignInBloc>(context).add(SignInUserLogout());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthenticationScreen(),
            ),
          );
        },
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}
