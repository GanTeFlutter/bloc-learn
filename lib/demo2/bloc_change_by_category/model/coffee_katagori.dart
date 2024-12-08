// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee.dart';

class CoffeeKatagori extends Equatable {
  final List<Coffee> coffeeList;
  final String katagori;

  const CoffeeKatagori({required this.coffeeList, required this.katagori});

  @override
  List<Object?> get props => [coffeeList, katagori];

  CoffeeKatagori copyWith({
    List<Coffee>? coffeeList,
    String? katagori,
  }) {
    return CoffeeKatagori(
      coffeeList: coffeeList ?? this.coffeeList,
      katagori: katagori ?? this.katagori,
    );
  }
}
