import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee.dart';
import 'package:flutter_bloc_learn/product/enum/e.firebase.dart';
import 'package:flutter_bloc_learn/product/service/firebase-service/firebase_service.dart';

import '../model/coffe_base.dart';

part 'home_category_event.dart';
part 'home_category_state.dart';

class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  HomeCategoryBloc() : super(CategoryInitial()) {
    on<HomeCategoryEvent>(_homeEmitState);
  }
  final FirebaseService _firebaseService = FirebaseService();

  void _homeEmitState(HomeCategoryEvent event, Emitter<HomeCategoryState> emit) {
    var response = _firebaseService.firebaseService(
      collectionName: FirebaseCollectionName.coffee.name,
      fromJson: (json) => Coffee.fromJson(json),
      docName: event.toString(),
    );

    if (event.toString() == FirebaseDocumentName.ebk.name) {
      var response = _firebaseService.firebaseService(
        collectionName: FirebaseCollectionName.coffee.name,
        fromJson: (json) => Coffee.fromJson(json),
        docName: event.toString(),
      );
      emit(
        CategoryEBK(
          coffeStateEBK: CoffeBase(coffeList: response),
        ),
      );
    } else if (event.toString() == FirebaseDocumentName.sk.name) {
      emit(
        CategorySK(
          coffeStateSK: CoffeBase(coffeList: []),
        ),
      );
    } else if (event.toString() == FirebaseDocumentName.stk.name) {
      emit(
        CategorySTK(
          coffeStateSTK: CoffeBase(coffeList: []),
        ),
      );
    } else {
      emit(const CategoryError(message: 'Error'));
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