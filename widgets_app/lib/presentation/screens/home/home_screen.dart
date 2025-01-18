

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: colors.primary,),
      itemCount: appMenuItems.length, 
      itemBuilder: (context, index) {
        final MenuItem menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      onTap: () {
        context.pushNamed(menuItem.name);
      },
      subtitle: Text(menuItem.subtitle),
    );
  }
}