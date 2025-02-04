import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_iqnos/presentation/screens/home_screen.dart';
import 'package:test_iqnos/presentation/screens/login_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomeScreen(),
      // pageBuilder: (context, state) {
      //   return CustomTransitionPage(
      //     key: state.pageKey,
      //     child: HomeScreen(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       // Change the opacity of the screen using a Curve based on the the animation's
      //       // value
      //       final _controller = AnimationController(vsync: this);
      //       return SlideTransition(
      //           position: animation.drive(
      //             Tween<Offset>(
      //               begin: const Offset(1, 0),
      //               end: Offset.zero,
      //             ).chain(CurveTween(curve: Curves.easeIn)),
      //           ),
      //           child: child);
      //     },
      //   );
      // },
    )
  ],
);
