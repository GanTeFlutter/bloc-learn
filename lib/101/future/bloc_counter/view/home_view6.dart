import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/future/bloc_counter/bloc/counter_bloc.dart';

class HomeView6 extends StatefulWidget {
  const HomeView6({super.key});

  @override
  State<HomeView6> createState() => _HomeView6State();
}

class _HomeView6State extends State<HomeView6> {
  @override
  Widget build(BuildContext context) {
    final blocinstance = context.read<CounterBloc6>();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder(
            builder: (context, state) {
              return Text('Counter Value: $state');
            },
            bloc: blocinstance),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              blocinstance.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              blocinstance.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              blocinstance.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.read_more),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                final parsedValue = int.tryParse(value);
                if (parsedValue != null) {
                  blocinstance.add(ParemetreliDenem(parsedValue));
                } else {
                  debugPrint("Geçersiz bir sayı girdiniz");
                }
              },
            ),
            BlocBuilder<CounterBloc6, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
