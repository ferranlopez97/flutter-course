

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = "theme_changer";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final appTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme changer"),
        actions: [
           IconButton(onPressed: () => {
            ref.read(themeNotifierProvider.notifier).toggleDarkMode()
          }, icon: Icon( appTheme.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined)
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final colors = ref.watch(colorListProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text("Este color", style: TextStyle(color: color),),
          subtitle: Text("${color.value}"),
          value: index,
          activeColor: color,
          groupValue: appTheme.selectedColor,
          onChanged: (color) => {
            ref.read(themeNotifierProvider.notifier).setSelectedColor(index)
          },
        );
    });
  }
}