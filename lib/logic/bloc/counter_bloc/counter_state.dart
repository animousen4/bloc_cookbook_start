part of 'counter_bloc.dart';


// This is our state class
// We can build our widgets,
// depending on this state data.
// Our bloc could emit new states in event handlers (on<Event>), look at 
// counter_event.dart
@immutable
class CounterState {
  final int count;

  CounterState(this.count);
}

