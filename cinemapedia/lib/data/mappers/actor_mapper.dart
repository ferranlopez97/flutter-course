import 'package:cinemapedia/data/models/movieDB/credits_response.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
        ? "https://image.tmdb.org/t/p/w500/${cast.profilePath!}"
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoWcWg0E8pSjBNi0TtiZsqu8uD2PAr_K11DA&s",
        character: cast.character,
      );
}
