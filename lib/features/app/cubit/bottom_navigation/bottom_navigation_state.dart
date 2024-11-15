part of 'bottom_navigation_cubit.dart';

sealed class BottomNavigationState {}

class BottomNavigationInitial extends BottomNavigationState {
  final int index;

  BottomNavigationInitial([this.index=0]);
}
