import 'package:cinemapedia/data/models/movieDB/movie_details.dart';
import 'package:cinemapedia/data/models/movieDB/movie_moviedb.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

extension MovieMovieDBExtension on MovieMovieDB {
  Movie toEntity() {
    return MovieMapper.movieDBToEntity(this);
  }
}

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != "") 
      ? "https://image.tmdb.org/t/p/w500${movieDB.backdropPath}"
      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoWcWg0E8pSjBNi0TtiZsqu8uD2PAr_K11DA&s", 
      genreIds: movieDB.genreIds.map((id) => id.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != "") 
      ? "https://image.tmdb.org/t/p/w500${movieDB.posterPath}"
      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoWcWg0E8pSjBNi0TtiZsqu8uD2PAr_K11DA&s",
      releaseDate: movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
    adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != "") 
      ? "https://image.tmdb.org/t/p/w500${movieDB.backdropPath}"
      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoWcWg0E8pSjBNi0TtiZsqu8uD2PAr_K11DA&s", 
      genreIds: movieDB.genres.map((genre) => genre.name.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != "") 
      ? "https://image.tmdb.org/t/p/w500${movieDB.posterPath}"
      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoWcWg0E8pSjBNi0TtiZsqu8uD2PAr_K11DA&s",
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount
  );
}
