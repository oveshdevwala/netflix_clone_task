part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesGetAllEvents extends MoviesEvent {}

class MoviesGetPopularMoviesEvents extends MoviesEvent {}

class MoviesGetThrillerEvents extends MoviesEvent {}

class MoviesGetComedyEvents extends MoviesEvent {}

class MoviesGetDramaEvents extends MoviesEvent {}

class MoviesGetGameShowEvents extends MoviesEvent {}

class MoviesGetSciFiEvents extends MoviesEvent {}
