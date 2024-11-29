// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';

class BasketItemModel {
  final CoffeeModel coffeeModel;
  int quantity; 
  BasketItemModel({
    required this.coffeeModel,
    required this.quantity,
  });
  // Toplam fiyatı hesaplamak için
  // Ürünün fiyatı ile miktarı çarpıyoruz
  //Miktari da kulanici adeti artiirdigi zaman copy with ile guncelliyoruz
  double get totalPrice => coffeeModel.price * quantity;

  BasketItemModel copyWith({
    CoffeeModel? coffeeModel,
    int? quantity,
  }) {
    return BasketItemModel(
      coffeeModel: coffeeModel ?? this.coffeeModel,
      quantity: quantity ?? this.quantity,
    );
  }
}
//quantity=adet
// totalPrice=Toplam fiyat