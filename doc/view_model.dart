// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ekle_firebase.dart';

abstract class EkleViewModel extends State<EkleFirebase> {
  Future<void> uploadJsonToFirestorre() async {
    try {
      // JSON verisini bir String olarak tanımla
      const String jsonData = '''
  {
  "coffee": {
    "ebk": {
      "coffees": [
        {
          "id": "ebk1",
          "name": "americano",
          "description": "Espresso ve sıcak su karışımı ile daha hafif içim sağlar.",
          "price": "135 TL",
          "image": "assets/image/coffee/coffee_image (1).jpg",
          "rating": 4,
          "extra": "smooth"
        },
        {
          "id": "ebk2",
          "name": "espresso",
          "description": "Yoğun ve saf kahve lezzeti sunar.",
          "price": "120 TL",
          "image": "assets/image/coffee/coffee_image (2).jpg",
          "rating": 5,
          "extra": "strong"
        },
        {
          "id": "ebk3",
          "name": "macchiato",
          "description": "Espresso üzerine bir miktar süt köpüğü eklenerek hazırlanır.",
          "price": "140 TL",
          "image": "assets/image/coffee/coffee_image (7).jpg",
          "rating": 3,
          "extra": "creamy"
        },
        {
          "id": "ebk4",
          "name": "ristretto",
          "description": "Daha yoğun ve az su ile hazırlanan bir espresso çeşidi.",
          "price": "130 TL",
          "image": "assets/image/coffee/coffee_image (8).jpg",
          "rating": 5,
          "extra": "intense"
        },
        {
          "id": "ebk5",
          "name": "flat_white",
          "description": "Espresso ve incecik bir süt köpüğü ile hazırlanır.",
          "price": "150 TL",
          "image": "assets/image/coffee/coffee_image (9).jpg",
          "rating": 4,
          "extra": "balanced"
        },
        {
          "id": "ebk6",
          "name": "lungo",
          "description": "Espresso'dan daha fazla su ile hazırlanan daha hafif bir kahve.",
          "price": "125 TL",
          "image": "assets/image/coffee/coffee_image (10).jpg",
          "rating": 3,
          "extra": "mild"
        }
      ]
    },
    "sk": {
      "coffees": [
        {
          "id": "sk1",
          "name": "iced_americano",
          "description": "Espresso ve soğuk su ile hazırlanan ferahlatıcı bir kahve.",
          "price": "150 TL",
          "image": "assets/image/coffee/coffee_image (3).jpg",
          "rating": 4,
          "extra": "refreshing"
        },
        {
          "id": "sk2",
          "name": "cold_brew",
          "description": "12 saat boyunca soğuk suyla demlenmiş hafif ve pürüzsüz kahve.",
          "price": "180 TL",
          "image": "assets/image/coffee/coffee_image (4).jpg",
          "rating": 5,
          "extra": "smooth"
        },
        {
          "id": "sk3",
          "name": "iced_latte",
          "description": "Espresso, süt ve buz karışımı ile hazırlanan hafif bir kahve.",
          "price": "160 TL",
          "image": "assets/image/coffee/coffee_image (11).jpg",
          "rating": 3,
          "extra": "light"
        },
        {
          "id": "sk4",
          "name": "frappe",
          "description": "Blenderda hazırlanan köpüklü ve soğuk bir kahve.",
          "price": "170 TL",
          "image": "assets/image/coffee/coffee_image (12).jpg",
          "rating": 4,
          "extra": "frothy"
        },
        {
          "id": "sk5",
          "name": "affogato",
          "description": "Bir top vanilyalı dondurmanın üzerine sıcak espresso dökülerek hazırlanır.",
          "price": "190 TL",
          "image": "assets/image/coffee/coffee_image (13).jpg",
          "rating": 5,
          "extra": "decadent"
        },
        {
          "id": "sk6",
          "name": "mocha_ice",
          "description": "Çikolata, espresso ve süt karışımı ile hazırlanmış soğuk bir içecek.",
          "price": "200 TL",
          "image": "assets/image/coffee/coffee_image (14).jpg",
          "rating": 4,
          "extra": "sweet"
        }
      ]
    },
    "stk": {
      "coffees": [
        {
          "id": "stk1",
          "name": "latte",
          "description": "Espresso ve bol süt ile yumuşak bir kahve deneyimi.",
          "price": "140 TL",
          "image": "assets/image/coffee/coffee_image (5).jpg",
          "rating": 4,
          "extra": "milky"
        },
        {
          "id": "stk2",
          "name": "cappuccino",
          "description": "Espresso, süt ve süt köpüğü ile klasik bir kahve lezzeti.",
          "price": "145 TL",
          "image": "assets/image/coffee/coffee_image (6).jpg",
          "rating": 5,
          "extra": "foamy"
        },
        {
          "id": "stk3",
          "name": "mocha",
          "description": "Çikolata, espresso ve süt karışımı ile hazırlanan tatlı bir kahve.",
          "price": "160 TL",
          "image": "assets/image/coffee/coffee_image (15).jpg",
          "rating": 4,
          "extra": "chocolaty"
        },
        {
          "id": "stk4",
          "name": "caramel_macchiato",
          "description": "Espresso, süt köpüğü ve karamel sos ile tatlandırılmış kahve.",
          "price": "175 TL",
          "image": "assets/image/coffee/coffee_image (16).jpg",
          "rating": 5,
          "extra": "sweet"
        },
        {
          "id": "stk5",
          "name": "flat_white",
          "description": "Espresso ve ince süt köpüğü ile dengeli bir kahve.",
          "price": "150 TL",
          "image": "assets/image/coffee/coffee_image (9).jpg",
          "rating": 4,
          "extra": "smooth"
        },
        {
          "id": "stk6",
          "name": "hazelnut_latte",
          "description": "Espresso, süt ve fındık aroması ile zenginleştirilmiş bir kahve.",
          "price": "165 TL",
          "image": "assets/image/coffee/coffee_image (17).jpg",
          "rating": 4,
          "extra": "nutty"
        }
      ]
    }
  }
}

    ''';

      // JSON'u parse et
      Map<String, dynamic> jsonResult = jsonDecode(jsonData);

      // Firestore işlemleri
      final firestore = FirebaseFirestore.instance;
      final coffeeCollection = firestore.collection('coffee');

      jsonResult['coffee'].forEach((categoryId, categoryData) async {
        final categoryCoffees = categoryData['coffees'] as List<dynamic>;
        await coffeeCollection.doc(categoryId).set({
          'coffees': categoryCoffees,
        });
      });

      print("Veriler başarıyla Firebase'e yüklendi!");
    } catch (e) {
      print("Hata: $e");
    }
  }
}
