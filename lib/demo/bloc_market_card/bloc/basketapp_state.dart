import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BasketappState extends Equatable {
  const BasketappState();

  @override
  List<Object?> get props => [];
}

class BasketappInitial extends BasketappState {}

class BasketListEmit extends BasketappState {
  final List<CoffeeModel> basketList;

  const BasketListEmit(this.basketList);

  @override
  List<Object?> get props => [List.of(basketList)];
}


class BasketListLoading extends BasketappState {
  final String message;

  const BasketListLoading([this.message = 'Yükleniyor...']);

  @override
  List<Object?> get props => [message];
}

class BasketappError extends BasketappState {
  final String message;

  const BasketappError(this.message);
}

class BasketItemSayisiEmit extends BasketappState {
  final int basketItemSayisi;

  const BasketItemSayisiEmit(this.basketItemSayisi);

  @override
  List<Object?> get props => [basketItemSayisi];
}


class BasketState extends BasketappState {
  final List<CoffeeModel> basketList;
  final int basketItemCount;

  const BasketState(this.basketList, this.basketItemCount);

  @override
  List<Object?> get props => [basketList, basketItemCount];
}
