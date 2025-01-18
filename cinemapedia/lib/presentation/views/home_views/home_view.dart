import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    if (ref.watch(initialLoadingProvier)) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingRatedMovies = ref.watch(upcomingMoviesProvider);

    final slideshowMovies = ref.watch(moviesSlideShowProvider);
  

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(),
          title: CustomAppBar(),
        ),


        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(children: [
            MoviesSlideshow(movies: slideshowMovies),
            MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: "En cines",
              subtitle: "Lunes",
              loadNextPage:
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
            ),
            MovieHorizontalListview(
              movies: upcomingRatedMovies,
              title: "Proximamente",
              subtitle: "Este mes",
              loadNextPage: () =>
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListview(
              movies: popularMovies,
              title: "Populares",
              loadNextPage: () =>
                  ref.read(popularMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListview(
              movies: topRatedMovies,
              title: "Mejor valoradas",
              subtitle: "Of all time",
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            )
          ]);
        }, childCount: 1))
      ],
    );
  }
}

/**
 * Column(
        children: [
          const CustomAppBar(),
          MoviesSlideshow(movies: slideshowMovies),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: "En cines",
            subtitle: "Lunes",
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ), 
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: "Proximamente",
            subtitle: "Este mes",
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ), 
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: "Populares",
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: "Mejor valoradas",
            subtitle: "Of all time",
            loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          )
        ]
      ),
 */
