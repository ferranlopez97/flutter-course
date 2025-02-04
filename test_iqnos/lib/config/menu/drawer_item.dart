

import 'package:flutter/material.dart';

class DrawerItem {

  final String title; 
  final IconData icon; 
  final String route;

  const DrawerItem({
    required this.title, 
    required this.icon, 
    required this.route
  });
}


final drawerItems = [
  DrawerItem(title: "Intervenciones", icon: Icons.handyman_rounded, route: ""),
  DrawerItem(title: "Diagnostico", icon: Icons.scanner_rounded, route: ""),
  DrawerItem(title: "Plantillas", icon: Icons.bluetooth_rounded, route: ""),
];