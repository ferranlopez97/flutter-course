
import 'package:flutter/material.dart';
import 'package:test_iqnos/config/theme/app_theme.dart';
import 'package:test_iqnos/presentation/views/interventions_list_view.dart';

class InterventionsListScreen extends StatelessWidget {
  const InterventionsListScreen({super.key, required this.onIconPressed});

  final VoidCallback onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Intervenciones"),
        backgroundColor: Color(AppTheme().primaryColor),
        leading: IconButton(onPressed: onIconPressed, icon: Icon(Icons.menu)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300
        ),
        child: InterventionsListView()),
    );
  }
}


class DiagnosticScreen extends StatelessWidget {
  const DiagnosticScreen({super.key, required this.onIconPressed});

  final VoidCallback onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Diagnostico"),
        backgroundColor: Color(AppTheme().primaryColor),
        leading: IconButton(onPressed: onIconPressed, icon: Icon(Icons.menu)),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.pinkAccent),
        child: Center(child: Text("Diagnostico", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),),
      ),
    );
  }
}