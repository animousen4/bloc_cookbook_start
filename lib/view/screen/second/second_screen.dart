import 'package:bloc_cookbook_start/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Our second screen, that could access to our CounterBloc, because
// SecondScreen is under BlocProvider in widget tree and has new context,
// which provides build(BuildContext context) function in this class
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add appbar, so we could go back to previous page
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        // All the elements, in this BlocBuilder will be rebuild,
        // when bloc emits new state, same as other BlocBuilder's with
        // our indicated CounterBloc instance in generic (<CounterBloc, CounterState>)
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text("Second page counter: ${state.count}");
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Same as Add, but other event
              context.read<CounterBloc>().add(CounterSubstract());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // CounterBloc will be accessible, because it's under BlocProvider context.
              context.read<CounterBloc>().add(CounterAdd());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
