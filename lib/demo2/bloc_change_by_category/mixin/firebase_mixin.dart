import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee.dart';
import 'package:flutter_bloc_learn/product/enum/e.firebase.dart';
import 'package:flutter_bloc_learn/product/service/firebase-service/firebase_service.dart';

mixin FirebaseMixin {
  late final FirebaseService _firebaseService;

  void initFirebaseMixin() {
    _firebaseService = FirebaseService();
  }

  Future<void> getFirebaseDataMix() async {
    debugPrint('-*-Clicked');
    try {
      final List<Coffee> coffeeList = await _firebaseService.firebaseService(
        collectionName: FirebaseCollectionName.coffee.name,
        fromJson: (json) => Coffee.fromJson(json),
        docName: FirebaseDocumentName.ebk.name,
      );
      debugPrint('-*- CoffeeList: $coffeeList');
    } catch (e) {
      debugPrint('-*- Error: $e');
    }
  }
}
