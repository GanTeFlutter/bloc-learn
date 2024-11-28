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
}
//quantity=adet
// totalPrice=Toplam fiyat