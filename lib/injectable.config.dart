// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:netflix_clone/core/core.dart' as _i661;
import 'package:netflix_clone/core/di/app_module.dart' as _i1040;
import 'package:netflix_clone/features/app/cubit/bottom_navigation/bottom_navigation_cubit.dart'
    as _i1007;
import 'package:netflix_clone/features/movies/movies_bloc/movies_bloc.dart'
    as _i40;
import 'package:netflix_clone/features/search/search_bloc/search_bloc.dart'
    as _i450;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i1007.BottomNavigationCubit>(
        () => appModule.bottomNavigationCubit);
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i661.MoviesRepository>(() => appModule.moviesRepository);
    gh.lazySingleton<_i40.MoviesBloc>(() => appModule.moviesBloc);
    gh.lazySingleton<_i450.SearchBloc>(() => appModule.searchBloc);
    return this;
  }
}

class _$AppModule extends _i1040.AppModule {}
