// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

enum MoviesStatus { initial, loading, success, failure }

class MoviesState extends Equatable {
  const MoviesState({
    this.status = MoviesStatus.initial,
    this.error,
    this.card,
    this.popular,
    this.thriller,
    this.comedy,
    this.drama,
    this.game,
    this.scifi,
  });

  final MoviesStatus status;
  final String? error;
  final List<ShowModel>? card;
  final List<ShowModel>? popular;
  final List<ShowModel>? thriller;
  final List<ShowModel>? comedy;
  final List<ShowModel>? drama;
  final List<ShowModel>? game;
  final List<ShowModel>? scifi;

  @override
  List<Object?> get props => [
        status,
        error,
        card,
        popular,
        thriller,
        comedy,
        drama,
        scifi,
        game,
      ];

  MoviesState copyWith({
    MoviesStatus? status,
    String? error,
    List<ShowModel>? card,
    List<ShowModel>? popular,
    List<ShowModel>? thriller,
    List<ShowModel>? comedy,
    List<ShowModel>? drama,
    List<ShowModel>? game,
    List<ShowModel>? scifi,
  }) {
    return MoviesState(
      status: status ?? this.status,
      error: error ?? this.error,
      card: card ?? this.card,
      popular: popular ?? this.popular,
      thriller: thriller ?? this.thriller,
      comedy: comedy ?? this.comedy,
      drama: drama ?? this.drama,
      game: game ?? this.game,
      scifi: scifi ?? this.scifi,
    );
  }
}
