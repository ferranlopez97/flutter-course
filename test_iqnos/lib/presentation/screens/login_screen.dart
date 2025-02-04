import 'package:flutter/material.dart';
import 'package:test_iqnos/config/router/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.greenAccent),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Screen"),
            SizedBox(height: 10,),
            OutlinedButton(onPressed: (){
              appRouter.go("/home");
            }, child: Text("LOGIN"))
          ],
        )),
      ),
    );
  }
}
