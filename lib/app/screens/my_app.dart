import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../authentication/authentication_screen.dart';
import '../style/app_theme.dart';
import '../style/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = BlocProvider.of<ThemeCubit>(context, listen: true);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const AuthenticationScreen(),
          theme: themeProvider.isDark ? darkTheme : lightTheme,
        );
      },
    );
  }
}
