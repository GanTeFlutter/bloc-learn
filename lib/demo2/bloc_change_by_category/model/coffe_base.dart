import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee_katagori.dart';

class CoffeBase {
  List<CoffeeKatagori> coffeList;
  CoffeBase({
    required this.coffeList,
  });

  CoffeBase copyWith({
    List<CoffeeKatagori>? coffeList,
  }) {
    return CoffeBase(
      coffeList: coffeList ?? this.coffeList,
    );
  }
}
