part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  failure,
}

class HomeState extends Equatable {
  final int counterValue;
  final HomeStatus status;

  const HomeState({
    required this.counterValue,
    required this.status,
  });

  static HomeState initial() => const HomeState(
        counterValue: 0,
        status: HomeStatus.initial,
      );

  HomeState copyWith({
    int? newCounterValue,
    HomeStatus? newStatus,
  }) =>
      HomeState(
        counterValue: newCounterValue ?? counterValue,
        status: newStatus ?? status,
      );

  @override
  List<Object?> get props => [
        counterValue,
        status,
      ];
}
