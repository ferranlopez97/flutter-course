

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => true);

final colorListProvider = Provider((ref) => colors);

final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


class ThemeNotifier extends StateNotifier<AppTheme> {

  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void setSelectedColor(int selectedColor){
    state = state.copyWith(selectedColor: selectedColor);
  }

}