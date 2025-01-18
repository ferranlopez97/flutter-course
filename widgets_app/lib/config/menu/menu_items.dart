

import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class MenuItem {

  final String title; 
  final String subtitle; 
  final String link;
  final IconData icon;
  final String name;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon, 
    required this.name
  });

}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: "Theme changer", 
    subtitle: "Tema dinamico",
    link: "/counter", 
    icon: Icons.color_lens_outlined, 
    name: ThemeChangerScreen.name
  ),
   MenuItem(
    title: "Counter Riverpod", 
    subtitle: "Introducción a riverpod",
    link: "/counter", 
    icon: Icons.list_alt_outlined, 
    name: CounterScreen.name
  ),
  MenuItem(
    title: "Botones", 
    subtitle: "Varios botones en Flutter",
    link: "/buttons", 
    icon: Icons.smart_button_outlined, 
    name: ButtonsScreen.name
  ),
  MenuItem(
    title: "Tarjetas", 
    subtitle: "Un contenedor estilizado",
    link: "/cards", 
    icon: Icons.credit_card,
    name: CardsScreen.name
  ),

  MenuItem(
    title: "Progress Indicators", 
    subtitle: "Generales y controlados",
    link: "/progress", 
    icon: Icons.refresh_rounded, 
    name: ProgressScreen.name
  ),

  MenuItem(
    title: "Snackbars y dialogs", 
    subtitle: "Indicadores en pantalla",
    link: "/snackbars", 
    icon: Icons.info_outline, 
    name: SnackbarScreen.name
  ),

  MenuItem(
    title: "Animated Container", 
    subtitle: "Stateful widget animado",
    link: "/animated", 
    icon: Icons.check_box_outline_blank_outlined, 
    name: AnimatedScreen.name
  ),

  MenuItem(
    title: "UI Controls + Tiles", 
    subtitle: "Una serie de controles en Flutter",
    link: "/ui-controls", 
    icon: Icons.car_rental_outlined, 
    name: UiControlsScreen.name
  ),

  MenuItem(
    title: "Introducción a la app", 
    subtitle: "Tutorial de la app",
    link: "/tutorial", 
    icon: Icons.accessibility_new_rounded, 
    name: AppTutorialScreen.name
  ),

  MenuItem(
    title: "Infinite scroll y pull", 
    subtitle: "Lista infinitas y pull to refresh",
    link: "/infinite", 
    icon: Icons.list_alt_outlined, 
    name: InfiniteScrollScreen.name
  ),

  
];