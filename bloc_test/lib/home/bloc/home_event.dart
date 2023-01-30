part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class IncrementEvent extends HomeEvent {}

class DecrementEvent extends HomeEvent {}
