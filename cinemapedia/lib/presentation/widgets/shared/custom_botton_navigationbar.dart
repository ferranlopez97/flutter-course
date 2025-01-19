import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomBottonNavigationbar extends StatelessWidget {

  final int currentIndex;

  const CustomBottonNavigationbar({super.key, required this.currentIndex});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case "/":
        return 0;
      case "/categories": 
        return 1;
      case "/favorites":
        return 2; 
      default: 
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    context.go("/home/$index");
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      selectedItemColor: colors.tertiary,
      currentIndex: currentIndex,
      elevation: 80,
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: "Inicio"),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline), label: "Categorias"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "Favoritos")
      ]
    );
  }
}
