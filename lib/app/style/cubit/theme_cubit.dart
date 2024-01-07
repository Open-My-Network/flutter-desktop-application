import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  final bool _isDark = false;
  bool get isDark => _isDark;

  void changeTheme() {
    _isDark != isDark;
    emit(ThemeChanged());
  }
}
