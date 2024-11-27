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
}
