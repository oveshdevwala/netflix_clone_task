import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/app/app.dart';
import 'package:netflix_clone/features/movies/movies_bloc/movies_bloc.dart';
import 'package:netflix_clone/features/search/search_bloc/search_bloc.dart';
import 'package:netflix_clone/injectable.dart';

export 'app_view.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BottomNavigationCubit>(
        create: (context) => getIt<BottomNavigationCubit>(),
      ),
      BlocProvider<SearchBloc>(
        create: (context) => getIt<SearchBloc>(),
      ),
      BlocProvider<MoviesBloc>(
        create: (context) => getIt<MoviesBloc>()..add(MoviesGetAllEvents()),
      ),
    ], child: const AppView());
  }
}
