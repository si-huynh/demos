import 'package:dartz/dartz.dart';
import 'package:models/models.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Either<Product, String>> getProduct(String productId);
}
