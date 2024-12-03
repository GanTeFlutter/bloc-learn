// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String rating;
  final String extra;

  const CoffeeModel(
      this.id, this.name, this.description, this.image, this.price, this.rating, this.extra);

  @override
  List<Object> get props => [id, name, description, image, price, rating, extra];

  CoffeeModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? price,
    String? rating,
    String? extra,
  }) {
    return CoffeeModel(
      id ?? this.id,
      name ?? this.name,
      description ?? this.description,
      image ?? this.image,
      price ?? this.price,
      rating ?? this.rating,
      extra ?? this.extra,
    );
  }
}
