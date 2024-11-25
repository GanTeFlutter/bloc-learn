part of 'basketapp_bloc.dart';

@immutable
abstract class BasketappState extends Equatable {
  final List<CoffeeModel> basketList;

  const BasketappState(this.basketList);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class BasketappInitial extends BasketappState {
  const BasketappInitial(super.basketList);
}

class BasketappLoaded extends BasketappState {
  const BasketappLoaded(super.basketList);
}

class BasketappError extends BasketappState {
  const BasketappError(super.basketList);
}
