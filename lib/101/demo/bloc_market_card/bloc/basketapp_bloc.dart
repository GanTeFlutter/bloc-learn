import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/basket_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketappInitial()) {
    on<HomeAddBasket>(_homeAddBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
    on<EmitBasketModelMarketEkrani>(_basketModelMarketEkrani);
  }

  final BasketModel _basketModel = BasketModel();

  void _homeAddBasket(HomeAddBasket event, Emitter<BasketappState> emit) {
    // Mevcut ürünleri kopyaladık ve yeni bir liste oluşturduk "from" metodu ile
    final mevcutItemler = List<BasketItemModel>.from(_basketModel.items);
    // _basketModel.items demek BasketModel in icindeki  List<BasketItemModel> items; demek
    //yani BasketModel in icindeki items listesine alip mevcutItemler e atadik yeni bir referans ile,from metodu ile

    int kontrolEtVarMi = -1; // İlk başta, aranan öğenin bulunmadığını varsayıyoruz.
    for (int i = 0; i < mevcutItemler.length; i++) {
      if (mevcutItemler[i].coffeeModel.id == event.coffeeModel.id) {
        kontrolEtVarMi = i; // Şart sağlanıyorsa, o öğenin indeksini kaydediyoruz.
        break; // Öğeyi bulduktan sonra döngüyü sonlandırıyoruz.
      }
    }
    if (kontrolEtVarMi != -1) {
      final eslesenIndex = mevcutItemler[kontrolEtVarMi];
      mevcutItemler[kontrolEtVarMi] = eslesenIndex.copyWith(
        quantity: eslesenIndex.quantity + event.quantity,
      );
    } else {
      // -1 dönerse yani sepette yoksa yeni ürün ekle
      mevcutItemler.add(BasketItemModel(coffeeModel: event.coffeeModel, quantity: event.quantity));
    }
        _basketModel = _basketModel.copyWith(items: mevcutItemler);

  }

  void _basketModelMarketEkrani(EmitBasketModelMarketEkrani event, Emitter<BasketappState> emit) {}

  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {}

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {}
}
