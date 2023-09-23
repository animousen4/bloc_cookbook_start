import 'package:bloc_cookbook_start/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_cookbook_start/view/screen/second/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Our home screen. It could access to CounterBloc instance, because
// it's located below BlocProvider (BlocProvider, which provides CounterBloc to widget Tree)
// and has a new context (look at build(BuildContext context) function)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // All elements under builder will be updated each time,
          // when we use emit(CounterState()) function inside our ConterBloc
          // So, only Text label will be rebuild each time bloc emits a new state
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text("Counter value: ${state.count}");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Pass a new event to CounterBloc.
                    context.read<CounterBloc>().add(CounterSubstract());
                  },
                  child: const Text("Substract")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Pass a new event to CounterBloc.
                    context.read<CounterBloc>().add(CounterAdd());
                  },
                  child: const Text("Add")),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text("Go to second screen"))
        ],
      ),
    );
  }
}
