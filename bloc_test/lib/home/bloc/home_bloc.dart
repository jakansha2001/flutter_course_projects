import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<IncrementEvent>(_handleIncrementEvent);
    on<DecrementEvent>(_handleDecrementEvent);
  }

  Future<void> _handleIncrementEvent(
    IncrementEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(newStatus: HomeStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      newCounterValue: state.counterValue + 1,
      newStatus: HomeStatus.loaded,
    ));
  }

  Future<void> _handleDecrementEvent(
    DecrementEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(newStatus: HomeStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final newValue = state.counterValue - 1;
    emit(state.copyWith(
      newCounterValue: newValue,
      newStatus: newValue < 0 ? HomeStatus.failure : HomeStatus.loaded,
    ));
  }
}
