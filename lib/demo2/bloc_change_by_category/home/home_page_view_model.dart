import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/home/home_page.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/mixin/firebase_mixin.dart';
import 'package:flutter_bloc_learn/demo2/bloc_change_by_category/model/coffee/coffee.dart';
import 'package:flutter_bloc_learn/product/enum/e.firebase.dart';
import 'package:flutter_bloc_learn/product/service/firebase-service/firebase_service.dart';

abstract class HomePageViewModel extends State<HomePage> with FirebaseMixin {
  final FirebaseService _firebaseService = FirebaseService();

   Future<void> getFirebaseData() async {
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
