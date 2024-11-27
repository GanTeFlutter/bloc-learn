import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;

  const CoffeeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, description, price];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CoffeeModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
}
