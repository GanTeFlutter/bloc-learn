import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketappInitial()) {
    on<AddBasket>(_addBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
  }
  final List<CoffeeModel> _basketList = [];

  void _addBasket(AddBasket event, Emitter<BasketappState> emit) {
    _basketList.add(event.coffeeModel);
    emit(BasketState(List.of(_basketList), _basketList.length));
    debugPrint('--B-Sepete eklendi');
  }

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {
    _basketList.remove(event.coffeeModel);
    emit(BasketListEmit(List.of(_basketList)));
  }

  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {
    emit(BasketListEmit(List.of(_basketList)));
    debugPrint('--B-Sepet listesi emit edildi');
  }
}
