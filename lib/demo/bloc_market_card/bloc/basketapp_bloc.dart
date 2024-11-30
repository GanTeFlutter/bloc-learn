import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_item_model.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/model/basket_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketInitial()) {
    on<HomeAddBasket>(_homeAddBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
    on<EmitBasketModelMarketEkrani>(_basketModelMarketEkrani);
  }

  BasketModel _basketModel = BasketModel();

  void _homeAddBasket(HomeAddBasket event, Emitter<BasketappState> emit) {
    // Mevcut ürünleri kopyaladık ve yeni bir liste oluşturduk "from" metodu ile
    final mevcutItemler = List<BasketItemModel>.from(_basketModel.items);
    // _basketModel.items demek BasketModel in icindeki  List<BasketItemModel> items; demek
    //yani BasketModel in icindeki items listesine alip mevcutItemler e atadik yeni bir referans ile,from metodu ile

    int kontrolEtVarMi = -1; // İlk başta, aranan öğenin bulunmadığını varsayıyoruz.
    for (int i = 0; i < mevcutItemler.length; i++) {
      //mevcutItemler içerisinde dönüyoruz mevcutItemler içinde de BasketItemModeller var
      //bu BasketItemModel içinde de coffeeModel ve quantity var
      //coffeeModel içinde de id ler var bu id leri eventten gelen coffeeModel id ile karşılaştırıyoruz
      //eğer aynı id varsa kontrolEtVarMi ye "i" yi atıyoruz
      //"i"yi atamamızın sebebi, aynı id ye sahip ürün varsa, o ürünün miktarını arttırmak için

      if (mevcutItemler[i].coffeeModel.id == event.coffeeModel.id) {
        kontrolEtVarMi = i; // Şart sağlanıyorsa, o öğenin indeksini kaydediyoruz.
        break; // Öğeyi bulduktan sonra döngüyü sonlandırıyoruz.
      }
    }
    if (kontrolEtVarMi != -1) {
      // Eğer kontrolEtVarMi -1 değilse, yani sepette varsa!!!:

      //eslesen indexe mevcutItemler listesindeki kontrolEtVarMi indexini atadik
      //yani kullanicidan gelen eventteki id si ile mevcutItemler listesindeki id si ayni olan ürünü atadik

      final eslesenIndex = mevcutItemler[kontrolEtVarMi];

      //mevcutItemler icindeki kontrolEtVarMi indexine sahip olan quantity yi arttiriyoruz
      //çünkü aynı ürünü eklemek istediğinde miktarını arttırmak için
      //sepette zaten var biz miktarını arttırıyoruz
      mevcutItemler[kontrolEtVarMi] = eslesenIndex.copyWith(
        //Burda mevcutItemler içindeki BasketItemModel içindeki quantity yi arttiriyoruz ama
        // arttirirken copyWith metodu ile  arttırıp onu eski liste içindeki mevcutItemler[kontrolEtVarMi]!!! indexine atıyoruz
        miktar: eslesenIndex.miktar + event.quantity,
      );
    } else {
      // -1 dönerse yani sepette yoksa yeni ürün ekle
      mevcutItemler.add(BasketItemModel(coffeeModel: event.coffeeModel, miktar: event.quantity));
    }
    //_basketModeli güncelliyoruz
    // yani BasketModel içindeki items listesini güncelliyoruz
    _basketModel = _basketModel.copyWith(items: mevcutItemler);

    emit(BasketState(
      stateBasketModel: _basketModel,
      toplamAdet: _basketModel.totalMiktar,
      toplamFiyat: _basketModel.toplamfiyat,
    ));
  }

  void _basketModelMarketEkrani(EmitBasketModelMarketEkrani event, Emitter<BasketappState> emit) {}

  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {}

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {}
}
