

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = "snackbar_screen";
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

  ScaffoldMessenger.of(context).clearSnackBars(); 

    final snackbar = SnackBar(
      content: const Text("Hola Mundo"), 
      action: SnackBarAction(
        label: "Okay",
        onPressed: (){}
         ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
      title: const Text("¿Estas seguro?"),
      content: const Text("Qui quis enim anim elit ipsum minim quis excepteur qui magna laboris sunt sit ipsum. Lorem ad sit irure duis. Duis aliquip velit sunt sunt id id labore do officia est eiusmod veniam magna."),
      actions: [
        TextButton(
          onPressed: () => context.pop(), 
          child: const Text("Cancelar")
          ),
          FilledButton(
          onPressed: () => context.pop(), 
          child: const Text("Aceptar")
          )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context, 
                  children: const [Text("Aliquip quis irure consequat dolor pariatur commodo elit in irure consectetur eu. Non reprehenderit consectetur dolore sint do enim duis. Ullamco ut elit aute qui commodo aute deserunt consectetur adipisicing. Amet excepteur occaecat aliqua non eiusmod occaecat commodo consequat nostrud. Ut fugiat commodo nisi adipisicing irure et do consectetur eiusmod esse dolor commodo cillum commodo.")]
                );
              }, 
              child: const Text("Licensias usadas")
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text("Mostrar dialogo de pantalla")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar snackbar"), 
        icon: const Icon(Icons.remove_red_eye),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}