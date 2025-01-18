import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: "movie/:id",
              name: MovieScreen.name,
              builder: (context, state) =>
                  MovieScreen(movieID: state.pathParameters["id"] ?? "no-id"),
            ),
          ],
        ),
        GoRoute(
          path: "/favorites",
          builder: (context, state) => const FavoritesView(),
        )
      ])
  // GoRoute(
  //     path: "/",
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(
  //       childView: HomeView(),
  //     ),
  //     routes: [
  //       GoRoute(
  //           path: "movie/:id",
  //           name: MovieScreen.name,
  //           builder: (context, state) =>
  //               MovieScreen(movieID: state.pathParameters["id"] ?? "no-id"))
  //     ]),
]);
