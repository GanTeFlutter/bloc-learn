import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  //Başlangıç değeri 0 olan bir CounterCubit oluşturuyoruz.
  CounterCubit() : super(0);

  //Arttırma işlemlerini tanımlıyoruz.
  void increment() => emit(state + 1);
  //Azaltma işlemlerini tanımlıyoruz.
  void decrement() => emit(state - 1);

  //emit metodu ile state değişikliklerini bildiriyoruz.

}
