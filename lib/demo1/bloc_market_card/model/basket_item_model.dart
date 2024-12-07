// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_learn/demo1/bloc_market_card/model/coffe_mod.dart';

class BasketItemModel {
  final CoffeeModel coffeeModel;
  int miktar;
  BasketItemModel({
    required this.coffeeModel,
    required this.miktar,
  });
  // Toplam fiyatı hesaplamak için
  // Ürünün fiyatı ile miktarı çarpıyoruz
  //Miktari da kulanici adeti artiirdigi zaman copy with ile guncelliyoruz
  double get totalPrice => coffeeModel.price * miktar;

  BasketItemModel copyWith({
    CoffeeModel? coffeeModel,
    int? miktar,
  }) {
    return BasketItemModel(
      coffeeModel: coffeeModel ?? this.coffeeModel,
      miktar: miktar ?? this.miktar,
    );
  }
}
//miktar=adet
// totalPrice=Toplam fiyat
