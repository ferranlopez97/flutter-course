

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/data/models/movieDB/movie_details.dart';
import 'package:cinemapedia/data/models/movieDB/moviedb_response.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.movieDBKey, 
        "language": "es"
      }
    )
  );  

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
     return MovieDbResponse.fromJson(json).results
    .where((moviedb) => moviedb.posterPath != "no-poster")
    .map(
      (e) => e.toEntity()
    ).toList();
  }
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get(
      "/movie/now_playing", 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      "/movie/popular", 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      "/movie/top_rated", 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      "/movie/upcoming", 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieByID(String id) async {
    final response = await dio.get("/movie/$id",);

    if (response.statusCode != 200) throw Exception("Movie with id: $id not found");

    final movieDetails = MovieDetails.fromJson(response.data);

    final movie = MovieMapper.movieDetailsToEntity(movieDetails);
    
    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {

    if (query.isEmpty) return [];

    final response = await dio.get(
      "/search/movie", 
      queryParameters: {
        'query': query
      }
    );

    return _jsonToMovies(response.data);
    
  }

}