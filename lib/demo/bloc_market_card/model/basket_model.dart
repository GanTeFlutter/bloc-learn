import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';

//Sepetteki Ürünler
class BasketModel {
  //Sepetteki ürünlerin listesi ve toplam fiyatı item  BasketItemModel alıyoruz.
  final List<BasketItemModel> items;

  BasketModel({required this.items});

  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }

  int totalMiktar() {
    int totalQuantity = 0; // Toplama sıfırdan başlıyoruz.
    for (var item in items) {
      // Her bir ürün için döngü başlat.
      totalQuantity += item.quantity; // Ürünün miktarını mevcut toplamla topla.
    }
    return totalQuantity; // Sonuç olarak tüm ürünlerin toplam miktarını döndür.
  }
}

// fold<T>(T initialValue, T Function(T previousValue, E element) combine)
