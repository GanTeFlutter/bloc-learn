import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/cubit/cunter_cubit.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //BlocProvider ile CounterCubit'ı uygulamamıza ekliyoruz.
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomeView(),
      ),
    );
  }
}
