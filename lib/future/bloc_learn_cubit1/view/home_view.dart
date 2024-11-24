import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_learn_cubit1/cubit/cunter_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    debugPrint('HomeView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //CounterCubit'ın increment metodu tetikleniyor.
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          //CounterCubit'ın decrement metodu tetikleniyor.
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //read ve watch metotları ile state değişikliklerini dinleyebiliriz.
            //Nasıl çalıştıklarını aşağıda açıkladım.
            //Text('Counter: ${context.read<CounterCubit>().state}'),
            //Text('Counter: ${context.watch<CounterCubit>().state}'),

            //BlocBuilder ile CounterCubit'ın state'ini dinleyebiliriz.
            BlocBuilder<CounterCubit, int>(
              builder: (context, count) => Center(child: Text('Counter: $count')),
            ),
            customsizedbox(),
          ],
        ),
      ),
    );
  }

  SizedBox customsizedbox() => const SizedBox(height: 35);
}


/*
context.read
Dinlemez. context.read sadece bir kez, anlık olarak CounterCubit'in mevcut state'ine erişmek için kullanılır.
State değiştiğinde, widget yeniden çizilmez.

context.watch
Dinler. context.watch kullanıldığında, CounterCubit'in state'ini dinler ve state değiştiğinde widget yeniden çizilir.
Bu, BlocBuilder gibi çalışır, ancak daha kompakt bir kullanım sağlar.



context.watch kullanıldığında, bu ifade build metodu içerisinde yer aldığından build metodunun tamamını tetikler. Bu, gereksiz yere tüm widget ağacının yeniden oluşturulmasına yol açabilir.
BlocBuilder ile Optimizasyon:

BlocBuilder, yalnızca sarmaladığı widget'ı yeniden oluşturur. Bu sayede build metodunun tamamı tetiklenmez.
Daha az widget'ın yeniden çizilmesi, uygulama performansını artırır ve gereksiz iş yükünü önler.

*/