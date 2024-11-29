import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/basket_model.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/coffe_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketappInitial()) {
    on<AddBasket>(_addBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
    on<EmitBasketModelMarketEkrani>(_basketModelMarketEkrani);
  }
  final List<CoffeeModel> _basketList = [];

  final List<BasketModel> basketModelBlocList = [];

  void _basketModelMarketEkrani(EmitBasketModelMarketEkrani event, Emitter<BasketappState> emit) {
    final CoffeeModel kullanicidanGelenCoffeModel = event.coffeeModel;
    bool isExisting = false;

    for (var basketItem in basketModelBlocList.first.items) {
      if (basketItem.coffeeModel.id == kullanicidanGelenCoffeModel.id) {
        basketItem.quantity += 1;
        isExisting = true;
        break;
      }
    }

    if (!isExisting) {
      basketModelBlocList.first.items.add(
        BasketItemModel(coffeeModel: kullanicidanGelenCoffeModel, quantity: 1),
      );
    }

    emit(BasketBasketModel(List.of(basketModelBlocList)));
    debugPrint('--B-Sepet güncellendi: ${kullanicidanGelenCoffeModel.name}');
  }

  void _addBasket(AddBasket event, Emitter<BasketappState> emit) {
    _basketList.add(event.coffeeModel);

    emit(BasketState(List.of(_basketList), _basketList.length, toplamFiyatVeAdet()));
    debugPrint('--B-Sepete eklendi');
  }

  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {
    emit(BasketListEmit(List.of(_basketList)));
    debugPrint('--B-Sepet listesi emit edildi');
  }

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {
    _basketList.remove(event.coffeeModel);

    emit(BasketState(List.of(_basketList), _basketList.length, toplamFiyatVeAdet()));
    debugPrint('--B-Sepetinizden silindi');
  }

  double toplamFiyatVeAdet() {
    if (_basketList.isEmpty) return 0;
    return _basketList.fold(0, (sum, coffee) => sum + (coffee.price));
  }
}
