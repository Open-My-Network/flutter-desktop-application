import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/main/cubit/nav_rail_cubit.dart';

import '../utils/main_nav_rails_screen_list.dart';
import '../widget/main_app_bar_widget.dart';
import '../widget/main_nav_rail_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavRailCubit, NavRailState>(builder: (context, state) {
      final int index = (state as NavRailInitial).index;
      return Scaffold(
        appBar: mainAppBarWidget(context, navRailScreenList[index]['title']),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainNavRailWidget(),
            Expanded(
              child: navRailScreenList[index]['screen'],
            ),
          ],
        ),
      );
    });
  }
}
