import 'package:models/models.dart';
import 'package:network/network.dart';

class ProductMapper {
  static Product fromDto(ProductResponse productResponse) {
    return Product(
      id: productResponse.id,
      name: productResponse.name,
      description: productResponse.description,
      price: productResponse.price,
      image: productResponse.image,
      stock: productResponse.stock,
    );
  }
}
