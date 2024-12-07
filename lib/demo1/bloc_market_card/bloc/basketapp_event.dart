import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/coffe_mod.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasketappEvent {}

class HomeAddBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;
  final int quantity;

  HomeAddBasket({required this.coffeeModel, required this.quantity});
}

class DecreaseBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;
  final int quantity;

  DecreaseBasket({required this.coffeeModel, required this.quantity});
}

class RemoveBasket extends BasketappEvent {
  final CoffeeModel coffeeModel;

  RemoveBasket({required this.coffeeModel});
}
