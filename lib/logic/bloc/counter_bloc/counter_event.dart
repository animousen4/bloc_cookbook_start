part of 'counter_bloc.dart';

// Our events
// We could send this events to our bloc, and then
// handle and process them with 
// on<SomeEvent>(
//  (event, emit) {
//    // event - our event and this event details, 
//    // defined in our event class
//    //
//    // emit - our emitter, we can use it to emit new
//    // states of bloc, like emit(NewState(state args...))
//  }
// )
@immutable
sealed class CounterEvent {}

final class CounterAdd extends CounterEvent {}

final class CounterSubstract extends CounterEvent {}
