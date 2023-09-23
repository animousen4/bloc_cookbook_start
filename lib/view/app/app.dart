import 'package:bloc_cookbook_start/logic/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_cookbook_start/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // providing a root of our app with CounterBloc, so every element in tree below with formed new context*
    // could see instance of our bloc (context.read<CounterBloc>)
    //
    // * For example:
    // // THAT WON'T WORK
    // Widget build(BuildContext oldContext) =>
    //  return BlocProvider(
    //    create: (context) => CounterBloc(),
    //    child: ElevatedButton(
    //      child: Text("Add"),
    //      onPressed: () {
    //        // this won't work, because we are using and oldContext (look at build method argument)
    //        // It means, that CounterBloc isn't in that oldContext and is unaccessable.
    //        oldContext.read<CounterBloc>.add(CounterAdd())
    //      }
    //  )
    // )
    //
    // // So, lets solve this and add a new context
    // // SOLUTION 1. Use Builder, which provides new context
    //  Widget build(BuildContext oldContext) =>
    //    return BlocProvider(
    //      create: (context) => CounterBloc(),
    //      child: Builder(
    //        builder: (newContext) {
    //          return ElevatedButton(
    //            child: Text("Add"),
    //            onPressed: () {
    //              // Now this will work, because we've provided a new context with Builder.
    //              // And now, int our newContext, which was formed by Builder,
    //              // we could access instance of our bloc
    //              // In this lambda, we are accessing to a new context, not to old!
    //              newContext.read<CounterBloc>.add(CounterAdd())
    //            }
    //          );
    //        }
    //      )
    //  )
    //
    // // SOLUTION 2 - [OUR SOLUTION]. Use a new widget, which provides new context in build(BuildContext context) function
    // class HomeScreen extends StatelessWidget {
    //   const HomeScreen({super.key});
    //
    //   @override
    //   Widget build(BuildContext context) {
    //     return Scaffold(
    //      body: ElevatedButton(
    //        child: const Text("Add")
    //        onPressed: () {
    //          // In this lambda, we are using our new context (context of build function of HomeScreen),
    //          // not the old context, which was at the same level as provider.
    //          context.read<CounterBloc>().add(CounterAdd());
    //        },
    //      )
    //    );
    //   }
    // }
    //
    // // .....
    //
    //
    // return BlocProvider(
    //   create: (context) => CounterBloc(),
    //   child: MaterialApp(
    //     home: HomeScreen()
    //   ),
    // );
    //
    // Look at this realization:

    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
