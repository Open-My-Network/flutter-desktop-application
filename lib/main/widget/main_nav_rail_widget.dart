import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/main/cubit/nav_rail_cubit.dart';

class MainNavRailWidget extends StatelessWidget {
  const MainNavRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    return BlocBuilder<NavRailCubit, NavRailState>(
      builder: (context, state) {
        final int index = (state as NavRailInitial).index;
        return NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.video_call),
              label: Text('LEEP'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.article),
              label: Text('Posts'),
            ),
          ],
          labelType: labelType,
          selectedIndex: index,
          onDestinationSelected: (int value) =>
              context.read<NavRailCubit>().onDestinationSelected(value),
        );
      },
    );
  }
}
