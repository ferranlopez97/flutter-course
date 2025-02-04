import 'package:flutter/material.dart';

class DrawerScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  const DrawerScaffold(
      {super.key,
      required this.child,
      required this.title,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: child,
    );
  }
}
