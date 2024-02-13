import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:open_my_network_app/post/bloc_category/category_bloc.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:window_manager/window_manager.dart';

import 'app/screens/my_app.dart';
import 'app/style/cubit/theme_cubit.dart';
import 'authentication/sign_in/bloc/sign_in_bloc.dart';
import 'main/cubit/nav_rail_cubit.dart';
import 'post/bloc/post_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 720),
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostBloc(),
        ),
        BlocProvider(
          create: (_) => NavRailCubit(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => SignInBloc(),
        ),
        BlocProvider(
          create: (_) => SignUpBloc(),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
