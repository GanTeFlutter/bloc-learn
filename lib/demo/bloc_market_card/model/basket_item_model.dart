import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';

class BasketItemModel {
  final CoffeeModel product;
  int quantity; //ürün miktarı
  BasketItemModel({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;
}
