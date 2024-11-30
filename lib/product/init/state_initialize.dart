import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/101/future/bloc_builder_type/bloc/spesifik_bloc_enjecte.dart';
import 'package:flutter_bloc_learn/101/future/bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_bloc.dart';
import 'package:flutter_bloc_learn/101/future/bloc_selector_learn.dart/user_cubit.dart';
import 'package:flutter_bloc_learn/101/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';
import 'package:flutter_bloc_learn/101/demo2/basicbasket/basicbasket_cubit.dart';

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
        //
        BlocProvider(create: (context) => CounterBloc6()),
        //
        //Basket-Demo
        BlocProvider(create: (context) => BasketappBloc()),

        //BlocBuilderType
        BlocProvider(create: (context) => CarCartCubit()),
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
