// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';

//Sepetteki Ürünler
class BasketModel {
  //Sepetteki ürünlerin listesi
  //Yani sepetimiz Burası
  List<BasketItemModel> items;

  BasketModel({this.items = const []});

  //Sepetteki toplam fiyat
  double get toplamfiyat => items.fold(0, (sum, item) => sum + item.totalPrice);

  //Sepetteki toplam ürün miktarı
  int get totalMiktar => items.fold(0, (sum, item) => sum + item.miktar);

  BasketModel copyWith({
    List<BasketItemModel>? items,
  }) {
    return BasketModel(
      items: items ?? this.items,
    );
  }
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
