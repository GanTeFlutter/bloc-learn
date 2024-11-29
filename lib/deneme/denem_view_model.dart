import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';
import 'package:flutter_bloc_learn/deneme/deneme.dart';

abstract class DenemeViewModel extends State<DenenemView> {
  final List<BasketModel> basketModelBlcList = [
    BasketModel(
      items: [
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 1, name: 'Espresso', description: 'Strong coffee shot', price: 10),
            quantity: 1),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 2, name: 'Latte', description: 'Mild coffee with milk', price: 15),
            quantity: 2),
      ],
    ),
    BasketModel(
      items: [
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 3, name: 'Cappuccino', description: 'Creamy and foamy coffee', price: 20),
            quantity: 3),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 4, name: 'Americano', description: 'Diluted espresso', price: 12),
            quantity: 2),
      ],
    ),
    BasketModel(
      items: [
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 5, name: 'Macchiato', description: 'Espresso with foam', price: 18),
            quantity: 1),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 1, name: 'Espresso', description: 'Strong coffee shot', price: 10),
            quantity: 4),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 2, name: 'Latte', description: 'Mild coffee with milk', price: 15),
            quantity: 2),
      ],
    ),
    BasketModel(
      items: [
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 6, name: 'Flat White', description: 'Smooth coffee with milk', price: 14),
            quantity: 2),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 3, name: 'Cappuccino', description: 'Creamy and foamy coffee', price: 20),
            quantity: 3),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 4, name: 'Americano', description: 'Diluted espresso', price: 12),
            quantity: 1),
      ],
    ),
    BasketModel(
      items: [
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 7, name: 'Mocha', description: 'Chocolate-flavored coffee', price: 22),
            quantity: 1),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 5, name: 'Macchiato', description: 'Espresso with foam', price: 18),
            quantity: 2),
        BasketItemModel(
            coffeeModel: const CoffeeModel(
                id: 6, name: 'Flat White', description: 'Smooth coffee with milk', price: 14),
            quantity: 1),
      ],
    ),
  ];

  final List<BasketItemModel> basketItemModel = [
    BasketItemModel(
        coffeeModel: const CoffeeModel(
            id: 1, name: 'Espresso', description: 'Strong coffee shot', price: 10),
        quantity:0),
    BasketItemModel(
        coffeeModel: const CoffeeModel(
            id: 2, name: 'Latte', description: 'Mild coffee with milk', price: 15),
        quantity: 0),
  ];
}
