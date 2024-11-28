import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';

//Sepetteki Ürünler
class BasketModel {
  //Sepetteki ürünlerin listesi 
  final List<BasketItemModel> items;

  BasketModel({required this.items});

  //Sepetteki toplam fiyat
  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  //Sepetteki toplam ürün miktarı
  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
}

// fold<T>(T initialValue, T Function(T previousValue, E element) combine)
/**
 * 
 * Yukarıdaki fonksiyoların uzun kullanımları 
 *   double calculateTotalPrice() {
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
 */