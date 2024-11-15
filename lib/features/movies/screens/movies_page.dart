import 'package:flutter/material.dart';
import 'package:netflix_clone/features/movies/movies.dart';

export 'movies_view.dart';
class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoviesView();
  }
}