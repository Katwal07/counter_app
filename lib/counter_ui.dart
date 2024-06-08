import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterUI extends StatelessWidget {
  const CounterUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              print('build');
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter(),);
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed:  () { context.read<CounterBloc>().add(DecrementCounter(),);},
                child: const Icon(Icons.minimize_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
