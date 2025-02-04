import 'package:flutter/material.dart';
import 'package:test_iqnos/config/menu/drawer_item.dart';
import 'package:test_iqnos/config/router/app_router.dart';
import 'package:test_iqnos/config/theme/app_theme.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const SideMenu(
      {super.key,
      required this.scaffoldKey,
      required this.onDestinationSelected,
      required this.currentIndex});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: width * 0.6,
      child: Drawer(
        // selectedIndex: widget.currentIndex,
        // indicatorShape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // indicatorColor: colors.primaryContainer,
        // onDestinationSelected: (value) {
        //   widget.onDestinationSelected(value);
        // },
      
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  "assets/images/iqnos_positivo_colr_grupo.png",
                  scale: 0.3,
                ),
              ),
              Divider(),
              ...drawerItems.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    selected: widget.currentIndex == drawerItems.indexOf(e),
                    leading: Icon(
                      e.icon,
                      size: 28,
                    ),
                    selectedTileColor: Color(AppTheme().primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onTap: () {
                      widget.onDestinationSelected(drawerItems.indexOf(e));
                    },
                    title: Text(e.title),
                  ),
                );
              }),
              Expanded(child: Container()),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    size: 28,
                  ),
                  title: Text("Acerca de"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 28,
                  ),
                  onTap: () => appRouter.go("/"),
                  title: Text("Cerrar sesión"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
