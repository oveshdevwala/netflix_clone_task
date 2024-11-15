import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/core/common/models/models.dart';
import 'package:netflix_clone/core/common/repository/repository.dart';

part 'movies_events.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;
  MoviesBloc(MoviesRepository moviesRepository)
      : _moviesRepository = moviesRepository,
        super(const MoviesState()) {
    on<MoviesGetAllEvents>(_getAllMovies);
    on<MoviesGetPopularMoviesEvents>(_moviesGetPopularMoviesEvents);
    on<MoviesGetThrillerEvents>(_moviesGetThrillerEvents);
    on<MoviesGetComedyEvents>(_moviesGetComedyEvents);
    on<MoviesGetDramaEvents>(_moviesGetDramaEvents);
    on<MoviesGetGameShowEvents>(_moviesGetGameShowEvents);
    on<MoviesGetSciFiEvents>(_moviesGetSciFiEvents);
  }

  FutureOr<void> _getAllMovies(
      MoviesGetAllEvents event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(status: MoviesStatus.loading));
        try {
      debugPrint('Fetching Movies......................');
      final List<ShowModel> res = await _moviesRepository.getAllMovies();
      final List<ShowModel> popular = await _moviesRepository.searchMovies('popular');
      final List<ShowModel> thriller = await _moviesRepository.searchMovies('thriller');
      final List<ShowModel> comedy = await _moviesRepository.searchMovies('comedy');
      final List<ShowModel> drama = await _moviesRepository.searchMovies('drama');
      final List<ShowModel> gameShow = await _moviesRepository.searchMovies('game show');
      final List<ShowModel> sciFi = await _moviesRepository.searchMovies('sci-fi');

      debugPrint(res.length.toString());
        emit(state.copyWith(card: res,
        popular: popular, 
        thriller: thriller, 
        comedy: comedy, 
        game: gameShow, 
        drama: drama, 
        scifi: sciFi, 
        
        status: MoviesStatus.success));
      // } else {
      //   emit(state.copyWith(
      //       error: 'Search Movies Not Found', status: MoviesStatus.failure));
      // }
    } on SocketException catch (e) {
      emit(state.copyWith(error: e.message, status: MoviesStatus.failure));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: MoviesStatus.failure));
    }
  }

  FutureOr<void> _moviesGetPopularMoviesEvents(
      MoviesGetPopularMoviesEvents event, Emitter<MoviesState> emit) async {
    try {
      debugPrint('Fetching Movies......................');
      final List<ShowModel> res = await _moviesRepository.searchMovies('popular');
      debugPrint(res.length.toString());
      if (res.isNotEmpty) {
        emit(state.copyWith(card: res, status: MoviesStatus.success));
      } else {
        emit(state.copyWith(
            error: 'Search Movies Not Found', status: MoviesStatus.failure));
      }
    } on SocketException catch (e) {
      emit(state.copyWith(error: e.message, status: MoviesStatus.failure));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: MoviesStatus.failure));
    }
  }

  FutureOr<void> _moviesGetThrillerEvents(
      MoviesGetThrillerEvents event, Emitter<MoviesState> emit) {}

  FutureOr<void> _moviesGetComedyEvents(
      MoviesGetComedyEvents event, Emitter<MoviesState> emit) {}

  FutureOr<void> _moviesGetSciFiEvents(
      MoviesGetSciFiEvents event, Emitter<MoviesState> emit) {}

  FutureOr<void> _moviesGetDramaEvents(
      MoviesGetDramaEvents event, Emitter<MoviesState> emit) {}

  FutureOr<void> _moviesGetGameShowEvents(
      MoviesGetGameShowEvents event, Emitter<MoviesState> emit) {}
}
