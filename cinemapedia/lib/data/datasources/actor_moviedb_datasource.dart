

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/data/mappers/actor_mapper.dart';
import 'package:cinemapedia/data/models/movieDB/credits_response.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.movieDBKey, 
        "language": "es"
      }
    )
  ); 

  @override
  Future<List<Actor>> getActorsByMovie(String movieID) async {
    final response = await dio.get("/movie/$movieID/credits",);

    final list = CreditsResponse.fromJson(response.data)
      .cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return list;
  }
}