

import 'package:cinemapedia/data/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/data/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Provider es solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MoviedbDatasource());
});