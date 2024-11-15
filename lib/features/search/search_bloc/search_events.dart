part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchGetEvent extends SearchEvent {
  final String query;

  @override
  List<Object> get props => [query];
  const SearchGetEvent(this.query);
}
