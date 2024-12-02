import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/basket_model.dart';
import 'package:meta/meta.dart';

// BasketappState.dart

@immutable
abstract class BasketappState {}

class BasketInitial extends BasketappState {}

class BasketLoading extends BasketappState {}

class BasketState extends BasketappState {
  final BasketModel stateBasketModel;
  final int toplamAdet;
  final double toplamFiyat;
  BasketState(
      {required this.stateBasketModel, required this.toplamAdet, required this.toplamFiyat});
}

class BasketappError extends BasketappState {
  final String errorMessage;
  BasketappError({required this.errorMessage});
}
