import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/bloc_builder_type/bloc/spesifik_bloc_enjecte.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

class HomeView3 extends StatefulWidget {
  const HomeView3({super.key});

  @override
  State<HomeView3> createState() => _HomeView3State();
}

class _HomeView3State extends State<HomeView3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView3'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///-1
            //blocBuilder stati dinleyip icindeki texti yeniden cizdiriyor.
            //Burdaki Cubit Sınıfı Main.dart dosyasında MultiBlocProvider veya BlocProvider ile uygulamaya eklenmiş olmalıdır.
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              return Text('Counter Value: $state');
            }),

            customSizedBox(),

            ///-2
            //Burada ise BlocBuilder bloc parametresine EkranaYazdir cubitini veriyoruz.
            //EkranaYazdir Main.dart dosyasında MultiBlocProvider veye BlocProvider ile uygulamaya eklenmedik fakat
            //bloc parametresine verdiğimiz için bu cubiti dinleyebiliyoruz.
            //Yani sadece buradaki text widgetine enjekte edilmiş oluyor.
            BlocBuilder<EkranaYazdir, String>(
                //enjekte edilen cubit
                bloc: EkranaYazdir(),
                builder: (context, state) {
                  return Text('Ekrana Yazdır: $state');
                }),
            customSizedBox(),

            ///-3
            //Burada ise buildWhen parametresi ile state değişikliğini kontrol ediyoruz.
            //state uzunluğu 10 dan büyük olduğunda builder fonksiyonu oluşturulur ve widget yeniden inşa edilir.
            BlocBuilder<UcuncuOrnekCubit, String>(
              buildWhen: (previous, current) {
                //state uzunluğu 10 dan büyük olduğunda yeniden çizdir.
                return current.length > 10;
              },
              builder: (context, count) {
                return Text('Even count: $count');
              },
            ),

            customSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () => context.read<UcuncuOrnekCubit>().appendText('a'),
                    child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox customSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}


/*
previous  = öncesi
current   = mevcut,akım 
*/

/*


BlocBuilder'ın Temel Parametreleri

bloc (isteğe bağlı):
Hangi Bloc'un durumlarını dinleyeceğini belirtir.
Belirtilmezse, BlocProvider aracılığıyla mevcut olan Bloc'u otomatik olarak bağlar.


builder (zorunlu):
Bloc'un durumuna (state) göre bir widget döndüren fonksiyondur.
Pure (saf) bir fonksiyon olmalıdır, yani sadece duruma göre widget üretmelidir.


buildWhen (isteğe bağlı):
Önceki durum ve mevcut durumu karşılaştırır.
true dönerse, widget yeniden inşa edilir. false dönerse yeniden inşa edilmez.
Performans optimizasyonu sağlar.


 */
