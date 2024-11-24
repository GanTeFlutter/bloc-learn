import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_builder_type/bloc/spesifik_bloc_enjecte.dart';
import 'package:flutter_bloc_learn/future/bloc_builder_type/view/home_view3.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

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
          //cubit
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => StringCubit()),
          //bloc type 
          BlocProvider(create: (context) => UcuncuOrnekCubit()),
        ],
        child: const HomeView3(),
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
