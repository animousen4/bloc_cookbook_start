import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Inital State is CounterReady with conter value = 0
  CounterBloc() : super(CounterState(0)) {

    // Handling CounterAdd event
    on<CounterAdd>((event, emit) {
      // Creating a new state with count value + 1, from previous state (getter 'state');
      final newState = CounterState(state.count + 1);

      // Emitting new state. All BlocBuilders with instance of our bloc will be updated.
      // BlocBuilder<CounterBloc, CounterState> -- these builders
      emit(newState);
    });

    // Handling CounterSubstract event
    on<CounterSubstract>((event, emit) {
      // Creating a new state with count value - 1, from previous state (getter 'state');
      final newState = CounterState(state.count - 1);

      // Same as in CounterAdd, emitting a new state, so all the all relevant BlocBuilders
      // with CounterBloc instance will be rebuild.
      emit(newState);
    });
  }
}
