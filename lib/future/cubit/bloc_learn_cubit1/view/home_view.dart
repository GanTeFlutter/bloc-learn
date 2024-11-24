import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    ///debugPrint metodu ile build metodunun çalışıp çalışmadığını kontrol edebiliriz.
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
            // "arrow function"Dart'ta, bir fonksiyonu tek satırda ifade etmek istediğinizde bu yapıyı kullanabilirsiniz.
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          //CounterCubit'ın decrement metodu tetikleniyor.
          FloatingActionButton(
            // Normal fonksiyon tanımı
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
            ///read ve watch metotları ile state değişikliklerini dinleyebiliriz.
            //Nasıl çalıştıklarını aşağıda açıkladım.

            //Text('Counter: ${context.read<CounterCubit>().state}'),
            //Text('Counter: ${context.watch<CounterCubit>().state}'),

            ///ama bu şekilde kullanmak yerine BlocBuilder kullanmak daha mantıklıdır.
            ///Çünkü Build metodu içerisinde yer aldığından build metodunun tamamını tetikler.

            ///BlocBuilder ile CounterCubit'ın state'ini dinleyebiliriz.
            ///build metodunun tamamı tetiklenmez.
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

Yukarıda Column içerisindeki read,watch kullanıldığı textlerdeki yorum satırlarını kaldırın
Ardından, debugPrint kullanarak build metodunun çalışıp çalışmadığını gözlemlemek için debug konsolunu açın.
 Sayfada artırma veya azaltma işlemi yaptığınızda, build metodunun yeniden çalışıp çalışmadığını kontrol edin.

context.watch kullanıldığında, bu ifade build metodu içerisinde yer aldığından build metodunun tamamını tetikler. Bu, gereksiz yere tüm widget ağacının yeniden oluşturulmasına yol açabilir.
BlocBuilder ile Optimizasyon:

BlocBuilder, yalnızca sarmaladığı widget'ı yeniden oluşturur. Bu sayede build metodunun tamamı tetiklenmez.
Daha az widget'ın yeniden çizilmesi, uygulama performansını artırır ve gereksiz iş yükünü önler.

*/