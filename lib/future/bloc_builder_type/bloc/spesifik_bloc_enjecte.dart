import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EkranaYazdir extends Cubit<String> {
  EkranaYazdir() : super('Başlangıç metni');

  void emitText() {
    emit(state);
  }

  void updateText(String newText) {
    emit(newText);
  }
}

class UcuncuOrnekCubit extends Cubit<String> {
  UcuncuOrnekCubit() : super('Başla');

  void emitText() {
    emit(state);
  }

  void updateText(String newText) {
    emit(newText);
  }

  void appendText(String textToAppend) {
    emit(state + textToAppend);
    //view state uzunluğunu kontrol ediyoruz.
    //view da when parametresine 10 dan büyük olunca yeniden çizdir diyoruz.
    //debugdan artisi izliyoruz
    debugPrint('state: ${state.length}');
  }
}
