import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasketappEvent {}

class EmitBasketList extends BasketappEvent {}

class AddBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;
  AddBasket({required this.coffeeModel});
}

class RemoveBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;
  RemoveBasket({required this.coffeeModel});
}

class EmitBasketModelMarketEkrani extends BasketappEvent {
  final CoffeeModel coffeeModel;
  EmitBasketModelMarketEkrani({required this.coffeeModel});
}

class EmitBasketUrunSayisi extends BasketappEvent {}

class UpdateBasket extends BasketappEvent {}

class ClearBasket extends BasketappEvent {}

class EvenDeneme extends BasketappEvent {}
