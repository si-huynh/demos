import 'package:dartz/dartz.dart';
import 'package:domain/src/mapper/product_mapper.dart';
import 'package:domain/src/repository/product_repository.dart';
import 'package:models/models.dart';
import 'package:network/network.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient _apiClient;

  ProductRepositoryImpl({required apiClient}) : _apiClient = apiClient;

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await _apiClient.getProducts();
    if (response.data == null || response.error != null) {
      return [];
    }
    return response.data!.map(ProductMapper.fromDto).toList();
  }

  @override
  Future<Either<Product, String>> getProduct(String productId) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await _apiClient.getProduct(productId);
    if (response.data != null) {
      return left(ProductMapper.fromDto(response.data!));
    }
    if (response.error == true && response.reason != null) {
      return right(response.reason!);
    }
    return right('Unknown error');
  }
}
