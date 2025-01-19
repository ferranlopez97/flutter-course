import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final callback = ref.watch(movieRepositoryProvider).getMovieByID;

  return MovieMapNotifier(getMovie: callback);

});



typedef GetMovieCallback = Future<Movie> Function(String id);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieID) async {
    if (state.containsKey(movieID)) return;

    final movie = await getMovie(movieID);
    state = {...state, movieID: movie};
  }

}