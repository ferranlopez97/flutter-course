import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  void showSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar snackBar = SnackBar(content: Text(message), duration: const Duration(seconds: 1),);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {


    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        autoplayDelay: 2500,
        fade: 0.6,
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.inversePrimary,
            color: colors.secondary
          )
        ),
        autoplayDisableOnInteraction: true,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movies[index]),
        onTap: (index) {
          final movie = movies[index];
          showSnackBar(context: context, message: movie.title);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide(this.movie);

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black87, 
          blurRadius: 10, 
          offset: Offset(10, 10)
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30), 
      child: DecoratedBox(
        decoration:  decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath, 
            fit: BoxFit.cover,
            )
          )
        ),
    );
  }
}
