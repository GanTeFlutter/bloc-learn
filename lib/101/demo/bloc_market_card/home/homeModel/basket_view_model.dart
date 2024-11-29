import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/home/basket_view.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/coffe_model.dart';

abstract class BasketViewModel extends State<BasketView> {
  final List<CoffeeModel> coffeeList = [
    const CoffeeModel(
      id: 1,
      name: "Espresso",
      description: "Yoğun ve saf kahve deneyimi.",
      price: 25.0,
    ),
    const CoffeeModel(
      id: 2,
      name: "Cappuccino",
      description: "Espresso, süt ve süt köpüğü ile hazırlanır.",
      price: 30.0,
    ),
    const CoffeeModel(
      id: 3,
      name: "Latte",
      description: "Espresso ve buharda ısıtılmış süt karışımı.",
      price: 28.0,
    ),
    const CoffeeModel(
      id: 4,
      name: "Mocha",
      description: "Çikolata aromalı kahve spesiyali.",
      price: 35.0,
    ),
    const CoffeeModel(
      id: 5,
      name: "Americano",
      description: "Espresso'nun sıcak su ile seyreltilmiş hali.",
      price: 20.0,
    ),
  ];
}
