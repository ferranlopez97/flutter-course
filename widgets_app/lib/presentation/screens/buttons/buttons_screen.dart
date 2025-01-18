
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const name = "button_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Elevated button")),
            const ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm), label: const Text("Elevated Icon"),),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(onPressed: () {}, label: const Text("Filled Icon"), icon: const Icon(Icons.accessibility_new),), 
            OutlinedButton(onPressed: (){}, child: const Text("Outlined")),
            OutlinedButton.icon(onPressed: (){}, label: const Text("Outlined Icon"), icon: const Icon(Icons.terminal), iconAlignment: IconAlignment.end,),
            TextButton(onPressed: () {}, child: const Text("Text")), 
            TextButton.icon(onPressed: (){}, label: const Text("Text icon"), icon: const Icon(Icons.text_decrease)),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary), 
                iconColor: const WidgetStatePropertyAll(Colors.white)
              ),
              ),

          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text("Hola Mundo", style: TextStyle(color: Colors.white),)
            ),
        ),
      ),
    );
  }
}