import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/coffe_model.dart';

class CoffeeKatagori extends Equatable {
  final List<CoffeeModel> coffeeList;
  final String katagori;

  const CoffeeKatagori({required this.coffeeList, required this.katagori});

  @override
  List<Object?> get props => [coffeeList, katagori];
}
