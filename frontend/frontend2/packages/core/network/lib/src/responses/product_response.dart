import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable(createToJson: false)
class ProductResponse {
  ProductResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.stock,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  final int stock;
}
