import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String id; // Benzersiz araba kimliği
  final String brand; // Marka
  final String model; // Model
  final double price; // Fiyat
  final int stock; // Mevcut stok miktarı

  const Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.stock,
  });

  // copyWith metodu
  Car copyWith({
    String? id,
    String? brand,
    String? model,
    double? price,
    int? stock,
  }) {
    return Car(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  @override
  List<Object?> get props => [id, brand, model, price, stock];
}

class CarCartItem {
  final Car car;
  final int quantity;

  const CarCartItem({required this.car, required this.quantity});

  CarCartItem copyWith({Car? car, int? quantity}) {
    return CarCartItem(
      car: car ?? this.car,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CarCart {
  final List<CarCartItem> items;

  const CarCart({this.items = const []});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.car.price * item.quantity));

  CarCart copyWith({List<CarCartItem>? items}) {
    return CarCart(
      items: items ?? this.items,
    );
  }
}
