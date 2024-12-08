import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee.g.dart';

@JsonSerializable()
class Coffee {
  String? id;
  String? name;
  String? description;
  String? extra;
  String? image;
  String? price;
  int? rating;

  Coffee({
    this.id,
    this.name,
    this.description,
    this.extra,
    this.image,
    this.price,
    this.rating,
  });



  factory Coffee.fromJson(Map<String, dynamic> json) {
    return _$CoffeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoffeeToJson(this);

  Coffee copyWith({
    String? id,
    String? name,
    String? description,
    String? extra,
    String? image,
    String? price,
    int? rating,
  }) {
    return Coffee(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      extra: extra ?? this.extra,
      image: image ?? this.image,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Coffee) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      extra.hashCode ^
      image.hashCode ^
      price.hashCode ^
      rating.hashCode;
}
