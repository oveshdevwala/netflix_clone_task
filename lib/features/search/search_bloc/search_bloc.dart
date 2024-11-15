import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/core/common/repository/repository.dart';
import 'package:netflix_clone/features/movies/models/models.dart';

part 'search_events.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesRepository _moviesRepository;
  SearchBloc(MoviesRepository moviesRepository)
      : _moviesRepository = moviesRepository,
        super(const SearchState()) {
    on<SearchGetEvent>(_searchMovies);
  }

  FutureOr<void> _searchMovies(
      SearchGetEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    try {
      debugPrint('Searching......');
      final List<ShowModel> res =
          await _moviesRepository.searchMovies(event.query);
      debugPrint('Search Sussessfullly Done');
      debugPrint('Search Sussessfullly ${res.first.show!.name}');
      emit(state.copyWith(status: SearchStatus.success, movies: res));
      if (res.isEmpty) {
        emit(state.copyWith(
            error: 'Search Movies Not Found', status: SearchStatus.failure));
      }
    } on SocketException catch (e) {
      emit(state.copyWith(error: e.message, status: SearchStatus.failure));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: SearchStatus.failure));
    }
  }
}
