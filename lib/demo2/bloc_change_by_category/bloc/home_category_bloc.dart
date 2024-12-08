import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee_katagori.dart';
import 'package:flutter_bloc_learn/product/service/firebase-service/firebase_service.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  HomeCategoryBloc() : super(CategoryInitial()) {
    on<HomeCategoryFetchCoffee>(_homeEmitState);
  }
  final FirebaseService _firebaseService = FirebaseService();
  Future<void> _homeEmitState(
      HomeCategoryFetchCoffee event, Emitter<HomeCategoryState> emit) async {
    emit(CategoryInitial());
    try {
      final responseFire = await _firebaseService.firebaseService(
        collectionName: 'coffee',
        fromJson: Coffee.fromJson,
        docName: event.categoryName,
      );

      final coffeState = CoffeeKatagori(
        coffeeList: responseFire,
        katagori: event.categoryName,
      );

      emit(CoffeeKategoryState(coffeStateK: coffeState));
    } catch (e) {
      emit(CategoryError(message: 'Bloc Error: ${e.toString()}'));
    }
  }
}

//CategoryEBK(coffeStateEBK: CoffeBase(coffeList: []))



/**
 * String eventktg = event.toString();
    if (eventktg == FirebaseDocumentName.ebk.name) {
    } else if (eventktg == FirebaseDocumentName.sk.name) {
    } else if (eventktg == FirebaseDocumentName.stk.name) {
    } else {}
 */


/*
   if (event.toString() == FirebaseDocumentName.ebk.name) {
    } else if (event.toString() == FirebaseDocumentName.sk.name) {
    } else if (event.toString() == FirebaseDocumentName.stk.name) {
    } else {
      emit(const CategoryError(message: 'Error'));
    }
*/ 