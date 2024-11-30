import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_event.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/bloc/basketapp_state.dart';
import 'package:flutter_bloc_learn/101/demo/bloc_market_card/model/basket_model.dart';

class BasketappBloc extends Bloc<BasketappEvent, BasketappState> {
  BasketappBloc() : super(BasketappInitial()) {
    on<HomeAddBasket>(_homeAddBasket);
    on<EmitBasketList>(_emitBasketList);
    on<RemoveBasket>(_removeBasket);
    on<EmitBasketModelMarketEkrani>(_basketModelMarketEkrani);
  }

  final BasketModel _basketModel = BasketModel();
 
  void _homeAddBasket(HomeAddBasket event, Emitter<BasketappState> emit) {}

  void _basketModelMarketEkrani(EmitBasketModelMarketEkrani event, Emitter<BasketappState> emit) {}


  void _emitBasketList(EmitBasketList event, Emitter<BasketappState> emit) {}

  void _removeBasket(RemoveBasket event, Emitter<BasketappState> emit) {}
}
