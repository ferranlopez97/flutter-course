
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository{

  final ActorsDatasource datasource;

  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieID) {
    return datasource.getActorsByMovie(movieID);
  }

}