import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:meta/meta.dart';

// BasketappState.dart

@immutable
abstract class BasketappState {}

class BasketappInitial extends BasketappState {}

class BasketListLoading extends BasketappState {}

class BasketState extends BasketappState {
  final List<CoffeeModel> basketList;
  final int totalCount;
  final double totalPrice;
  BasketState(this.basketList, this.totalCount, this.totalPrice);
}

class BasketListEmit extends BasketappState {
  final List<CoffeeModel> basketList;

  BasketListEmit(this.basketList);
}

class BasketBasketModel extends BasketappState {
  final List<BasketModel> basketModel;
  BasketBasketModel(this.basketModel);
}

class BasketappError extends BasketappState {
  final String message;
  BasketappError(this.message);
}
