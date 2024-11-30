import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasketappEvent {}

class HomeAddBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;
  final int quantity;

  HomeAddBasket({required this.coffeeModel, required this.quantity});
}

class EmitBasketList extends BasketappEvent {}

class RemoveBasket extends BasketappEvent {}

class EmitBasketModelMarketEkrani extends BasketappEvent {}
