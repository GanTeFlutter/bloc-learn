import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/future/bloc_market_card/home/basket_view.dart';
import 'package:meta/meta.dart';

part 'basketapp_event.dart';
part 'basketapp_state.dart';



class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(const BasketappInitial([])) {
    // AddBasket Event'ini dinle
    on<AddBasket>((event, emit) {
      // Mevcut basketList'i al
      final updatedBasketList = List<CoffeeModel>.from(state.basketList);

      // Yeni gelen CoffeeModel'i sepete ekle
      updatedBasketList.add(event.basketModel);

      // Yeni state yayınla
      emit(BasketappLoaded(updatedBasketList));
    });

    // RemoveBasket Event'ini dinle
    on<RemoveBasket>((event, emit) {
      final updatedBasketList = List<CoffeeModel>.from(state.basketList);

      // Sepetten ürünü çıkar
      updatedBasketList.remove(event.basketModel);

      emit(BasketappLoaded(updatedBasketList));
    });

    // ClearBasket Event'ini dinle
    on<ClearBasket>((event, emit) {
      // Sepeti boşalt
      emit(const BasketappLoaded([]));
    });
  }
}
