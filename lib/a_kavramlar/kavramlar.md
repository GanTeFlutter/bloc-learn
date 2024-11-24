//BlocProvider


//BlocBuilder

//BlocSelector

//BlocListener 

//BlocConsumer 

`context.watch<BlocA>()`
`final isPositive = context.select((CounterBloc b) => b.state >= 0);`
`onPressed: () => context.read<CounterCubit>().increment()`

