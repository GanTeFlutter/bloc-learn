import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee/coffee.dart';

class CoffeeKatagori extends Equatable {
  final List<Coffee> coffeeList;
  final String katagori;

  const CoffeeKatagori({required this.coffeeList, required this.katagori});

  @override
  List<Object?> get props => [coffeeList, katagori];
}
