part of 'nav_rail_cubit.dart';

sealed class NavRailState extends Equatable {
  const NavRailState();

  @override
  List<Object> get props => [];
}

final class NavRailInitial extends NavRailState {
  final int index;
  const NavRailInitial({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}
