import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_builder_type/bloc/spesifik_bloc_enjecte.dart';
import 'package:flutter_bloc_learn/future/bloc_selector_learn.dart/user_cubit.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({super.key, required this.child});
   final Widget child;

  @override
  Widget build(BuildContext context) {
      //MultiBlocProvider ile birden fazla cubitimizi uygulamamıza ekleyebiliriz.
      //Açıklama alt kısmda verilmiştir.
    return MultiBlocProvider(
        providers: [
          //Cubit dosyası için
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => StringCubit()),
          //Bloc Type dosyası için
          BlocProvider(create: (context) => UcuncuOrnekCubit()),
          //BlocSelector kullanımı için
          BlocProvider(create: (context) => UserProfileCubit()),
        ],
        child: child,
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
