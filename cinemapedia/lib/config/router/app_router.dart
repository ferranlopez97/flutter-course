import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/home/0", routes: [

  GoRoute(
      path: "/home/:page",
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters["page"] ?? "0");
        return HomeScreen(
          pageIndex: pageIndex,
        );
      },
      routes: [
        GoRoute(
            path: "movie/:id",
            name: MovieScreen.name,
            builder: (context, state) => MovieScreen(movieID: state.pathParameters["id"] ?? "no-id"))
      ]),

      GoRoute(path: "/", 
      redirect:  (_, __) => "/home/0")
]);
