part of 'basketapp_bloc.dart';

@immutable
abstract class BasketappEvent {}

class AddBasket extends BasketappEvent {
  final CoffeeModel basketModel;
     AddBasket(this.basketModel);
}

class RemoveBasket extends BasketappEvent {
  final CoffeeModel basketModel;
  RemoveBasket(this.basketModel);
}

class UpdateBasket extends BasketappEvent {
  final CoffeeModel basketModel;
  UpdateBasket(this.basketModel);
}

class ClearBasket extends BasketappEvent {}
