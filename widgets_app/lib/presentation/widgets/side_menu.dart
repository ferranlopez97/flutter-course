import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    final textTheme = Theme.of(context).textTheme;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
            context.pushNamed(appMenuItems[navDrawerIndex].name);
            widget.scaffoldKey.currentState?.closeDrawer();
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 2 : 20, 16, 10),
            child: Text("Bienvenido", style: textTheme.titleLarge),
          ),
          ...appMenuItems.sublist(0, 3).map((item) {
            return NavigationDrawerDestination(
                icon: Icon(item.icon), label: Text(item.title));
          }),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text("Más opciones", style: textTheme.titleMedium),
          ),
          ...appMenuItems
          .sublist(3)
          .map((item) {
            return NavigationDrawerDestination(
                icon: Icon(item.icon), label: Text(item.title));
          }),
        ]);
  }
}
