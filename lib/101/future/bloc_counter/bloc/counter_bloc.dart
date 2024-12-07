import 'dart:math';

import 'package:bloc/bloc.dart';

class CounterBloc6 extends Bloc<CounterEvent, int> {
  CounterBloc6() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));

    on<CounterBoolEvent>((event, emit) => emit(Random().nextBool() ? 1 : 0));

    on<ParemetreliDenem>((event, emit) => emit(event.sayi));

    on<CounterIncrementPressed>(_deneme);
  }
  void _deneme(CounterEvent event, Emitter<int> emit) {
    if (state is CounterIncrementPressed) {
      emit(state + 1);
    }
  }
}

//---------------------
sealed class CounterEvent {}

final class ParemetreliDenem extends CounterEvent {
  final int sayi;
  ParemetreliDenem(this.sayi);
}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}

final class CounterBoolEvent extends CounterEvent {}

//---------------------

class CounterState {
  final String counter;
  CounterState(this.counter);
}

class CounterBoolState {
  final bool counter;
  CounterBoolState(this.counter);
}
// void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
//     if (state is TimerRunInProgress) {
//       _tickerSubscription?.pause();
//       emit(TimerRunPause(state.duration));
//     }
//   }
