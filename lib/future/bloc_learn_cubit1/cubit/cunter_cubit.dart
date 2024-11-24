import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  //Başlangıç değeri 0 olan bir CounterCubit oluşturuyoruz.
  CounterCubit() : super(0);

  //Arttırma işlemlerini tanımlıyoruz.
  void increment() => emit(state + 1);
  //Azaltma işlemlerini tanımlıyoruz.
  void decrement() => emit(state - 1);

  //emit metodu ile state değişikliklerini bildiriyoruz.

  //istersek methotlari acik bir sekilde de yazabiliriz.
  void increment2() {
    emit(state + 1);
  }
}

class StringCubit extends Cubit<String> {
  // Başlangıç durumu boş bir string
  StringCubit() : super('');

  // Metni güncelleyen bir fonksiyon
  void updateText(String newText) {
    emit(newText);
  }

  // Mevcut metni temizleyen bir fonksiyon
  void clearText() {
    emit('');
  }

  // Mevcut metne yeni bir metin ekleyen bir fonksiyon
  void appendText(String textToAppend) {
    emit(state + textToAppend);
  }
}
