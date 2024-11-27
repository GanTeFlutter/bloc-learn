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

  BasketState(this.basketList, this.totalCount);
}

class BasketListEmit extends BasketappState {
  final List<CoffeeModel> basketList;

  BasketListEmit(this.basketList);
}

class BasketappError extends BasketappState {
  final String message;
  BasketappError(this.message);
}
