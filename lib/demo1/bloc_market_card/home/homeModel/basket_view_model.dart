import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo1/bloc_market_card/home/home_view.dart';
import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/coffe_mod.dart';

abstract class BasketViewModel extends State<HomeView> {
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
