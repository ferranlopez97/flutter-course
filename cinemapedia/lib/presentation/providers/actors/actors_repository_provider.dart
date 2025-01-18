
import 'package:cinemapedia/data/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/data/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Provider es solo lectura
final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMoviedbDatasource());
});