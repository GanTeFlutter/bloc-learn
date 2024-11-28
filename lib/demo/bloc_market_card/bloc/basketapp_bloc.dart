import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/coffe_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketappInitial()) {
    on<AddBasket>(_addBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
    on<EmitBasketModelMarketEkrani>(_basketModelMarketEkrani);
  }
  final List<CoffeeModel> _basketList = [];

  final List<BasketModel> basketModelBlocList = [];

  void _basketModelMarketEkrani(EmitBasketModelMarketEkrani event, Emitter<BasketappState> emit) {
    //kullanıcın tıkladığı ürünü alıyoruz
    final CoffeeModel kullanicidanGelenCoffeModel = event.coffeeModel;
    //Sepetteki ürünlerin miktarını kontrol et ve artır
    bool isExisting = false;

    // basketModelBlocList icindeki modellerin icinde geziniyoruz
    for (var basketItem in basketModelBlocList.first.items) {
      //BasketItemModel incindeki BasketItemModel  icindeki coffeeModel id ile kullanicidanGelenCoffeModel id aynı ise
      //basketItem.quantity arttır
      if (basketItem.coffeeModel.id == kullanicidanGelenCoffeModel.id) {
        basketItem.quantity += 1;
        isExisting = true;
        break;
      }
    }
    //Eğer yukarıdan true bu kısım çalışmaz
    //Septte zaten varsa
    if (!isExisting) {
      basketModelBlocList.first.items.add(
        BasketItemModel(coffeeModel: kullanicidanGelenCoffeModel, quantity: 1),
      );
    }

    emit(BasketBasketModel(List.of(basketModelBlocList)));
    debugPrint('--B-Sepet güncellendi: ${kullanicidanGelenCoffeModel.name}');
  }

  void _addBasket(AddBasket event, Emitter<BasketappState> emit) {
    //event gelen coffeeModel'i basketList'e ekleyiyoruz
    _basketList.add(event.coffeeModel);

    //sonrasında yeni listeyi emit ediyoruz
    emit(BasketState(List.of(_basketList), _basketList.length, toplamFiyatVeAdet()));
    debugPrint('--B-Sepete eklendi');
  }

  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {
    //Sepet listesini emit ediyoruz
    //Ürünler sayafındaki ürünleri emt ettik
    emit(BasketListEmit(List.of(_basketList)));
    debugPrint('--B-Sepet listesi emit edildi');
  }

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {
    //gelen evente göre sepetten ürünü siliyoruz
    _basketList.remove(event.coffeeModel);

    //sonrasında yeni listeyi emit ediyoruz
    emit(BasketState(List.of(_basketList), _basketList.length, toplamFiyatVeAdet()));
    debugPrint('--B-Sepetinizden silindi');
  }

  double toplamFiyatVeAdet() {
    if (_basketList.isEmpty) return 0;
    return _basketList.fold(0, (sum, coffee) => sum + (coffee.price));
  }
/*
fold Fonksiyonu: Listenin elemanlarını dolaşır ve bir başlangıç değerine (0) göre toplama işlemi yapar.
Kısalık ve Okunabilirlik: Bu yöntem, aynı işlevi daha az satırda yapar ve modern Dart yazım tarzına uygundur.
*/
}

// double toplamFiyatVeAdet() {
//   double toplamFiyat = 0;
//   for (var coffeM in _basketList) {
//     toplamFiyat += coffeM.price;
//   }
//   return toplamFiyat;
// }
