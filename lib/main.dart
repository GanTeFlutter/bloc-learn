import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/cubit/home_view_cubit.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/view/home_view.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/view/string_cubit_view.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/view/string_cubit_view2.dart';

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
      //MultiBlocProvider ile birden fazla cubitimizi uygulamamıza ekleyebiliriz.
      //Açıklama alt kısmda verilmiştir.
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => StringCubit()),
        ],
        child: const StringCubitView2(),
      ),
    );
  }
}

/*
Tek bir cubitimiz var sa aşşağıdaki gibi bir kullanım yapabiliriz.
 home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const StringCubitView(),
      ),

ancak birden fazla cubitimiz varsa aşşağıdaki gibi bir kullanım yapabiliriz.
  home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => StringCubit()),
        ],
        child: const HomeView(),
      ),
bu şekilde birden fazla cubitimizi uygulamamıza ekleyebiliriz.      

*/
