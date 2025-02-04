import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_iqnos/config/router/app_router.dart';
import 'package:test_iqnos/presentation/screens/interventions_list_screen.dart';
import 'package:test_iqnos/presentation/widgets/shared/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
        currentIndex: currentViewIndex,
        onDestinationSelected: (value) async {
          await _closeDrawer(scaffoldKey.currentState);
          // scaffoldKey.currentState?.closeDrawer();
          setState(() {
            currentViewIndex = value;
          });

        },
      ),
      body: _loadCurrentView(
        currentSelection: currentViewIndex,
        onIconPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        onPop: () {
          setState(() {
            currentViewIndex = 0;
          });
        },
      ),
    );
  }
}

Future<void> _closeDrawer(ScaffoldState? state) async {
  state?.closeDrawer();
  await Future.delayed(Duration(milliseconds: 100));
}

Widget _loadCurrentView(
    {required int currentSelection, required VoidCallback onIconPressed, required VoidCallback onPop}) {

      bool canPop = currentSelection == 0;
  return PopScope(
    canPop: canPop,
    child: Builder(
      builder: (context) {
        if (currentSelection == 0) {
          return InterventionsListScreen(onIconPressed: onIconPressed);
        } else if (currentSelection == 1) {
          return DiagnosticScreen(
            onIconPressed: onIconPressed,
          );
        } else {
          return Placeholder();
        }
      },
    ),
    onPopInvokedWithResult: (didPop, result) {
      onPop();
    },
  );
}
