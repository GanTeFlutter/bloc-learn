import 'package:bloc/bloc.dart';

import 'package:flutter_bloc_learn/101/demo2/model/cars_mod.dart';

class CarCartCubit extends Cubit<CarCart> {
  CarCartCubit() : super(const CarCart());

  // Ürün ekleme
  void addItem(Car car, int quantity) {
    final currentItems = List<CarCartItem>.from(state.items);

    // Sepette ürün zaten varsa miktarı artır
    final existingItemIndex =
        currentItems.indexWhere((item) => item.car.id == car.id);

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];
      currentItems[existingItemIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      // Ürün sepette yoksa yeni ürün ekle
      currentItems.add(CarCartItem(car: car, quantity: quantity));
    }

    emit(state.copyWith(items: currentItems));
  }

  // Ürün çıkarma
  void removeItem(String carId) {
    final updatedItems =
        state.items.where((item) => item.car.id != carId).toList();
    emit(state.copyWith(items: updatedItems));
  }

  // Miktar artırma
  void increaseQuantity(String carId) {
    final currentItems = List<CarCartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.car.id == carId);

    if (itemIndex != -1) {
      final updatedItem = currentItems[itemIndex].copyWith(
        quantity: currentItems[itemIndex].quantity + 1,
      );
      currentItems[itemIndex] = updatedItem;
      emit(state.copyWith(items: currentItems));
    }
  }

  // Miktar azaltma
  void decreaseQuantity(String carId) {
    final currentItems = List<CarCartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.car.id == carId);

    if (itemIndex != -1) {
      final currentQuantity = currentItems[itemIndex].quantity;
      if (currentQuantity > 1) {
        final updatedItem = currentItems[itemIndex].copyWith(
          quantity: currentQuantity - 1,
        );
        currentItems[itemIndex] = updatedItem;
      } else {
        // Eğer miktar 1 ise ürünü tamamen çıkar
        currentItems.removeAt(itemIndex);
      }
      emit(state.copyWith(items: currentItems));
    }
  }

  // Sepeti temizleme
  void clearCart() {
    emit(const CarCart());
  }
}
