import 'package:flutter/material.dart';
import 'package:netflix_clone/features/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/movies/screens/movies_page.dart';
import 'package:netflix_clone/features/search/search.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
              index: state,
              children: const [MoviesPage(), SearchPage()],
            ),
            bottomSheet: NavigationBar(
                selectedIndex: state,
                onDestinationSelected: (index) {
                  context.read<BottomNavigationCubit>().changePage(index);
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.movie_creation_rounded),
                      label: 'Movies'),
                  NavigationDestination(
                      icon: Icon(Icons.search), label: 'Search')
                ]));
      },
    );
  }
}
