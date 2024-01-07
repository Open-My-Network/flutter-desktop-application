import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_rail_state.dart';

class NavRailCubit extends Cubit<NavRailState> {
  NavRailCubit() : super(const NavRailInitial(index: 0));

  void onDestinationSelected(int index) {
    emit(NavRailInitial(index: index));
  }
}
