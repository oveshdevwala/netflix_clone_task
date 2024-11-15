// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.error,
    this.movies,
  });

  final SearchStatus status;
  final String? error;
  final  List<ShowModel>? movies;

  @override
  List<Object?> get props => [status, error, movies];

  SearchState copyWith({
    SearchStatus? status,
    String? error,
     List<ShowModel>? movies,
  }) {
    return SearchState(
      status: status ?? this.status,
      error: error ?? this.error,
      movies: movies ?? this.movies,
    );
  }
}
