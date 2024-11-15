import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/core/core.dart';
import 'package:netflix_clone/features/app/cubit/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:netflix_clone/features/movies/movies_bloc/movies_bloc.dart';
import 'package:netflix_clone/features/search/search_bloc/search_bloc.dart';

@module
abstract class AppModule {
  @lazySingleton
  BottomNavigationCubit get bottomNavigationCubit => BottomNavigationCubit();
  @lazySingleton
  Dio get dio => Dio();
  @lazySingleton
  MoviesRepository get moviesRepository => MoviesRepository(dio);
  @lazySingleton
  MoviesBloc get moviesBloc => MoviesBloc(moviesRepository);
  @lazySingleton
  SearchBloc get searchBloc => SearchBloc(moviesRepository);
}
