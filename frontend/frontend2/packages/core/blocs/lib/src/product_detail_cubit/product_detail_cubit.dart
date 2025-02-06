import 'package:blocs/blocs.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
part 'product_detail_state.dart';
part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this._productRepository)
      : super(const ProductDetailState.initial());

  final ProductRepository _productRepository;

  Future<void> getProduct(String productId) async {
    emit(const ProductDetailState.loading());
    final response = await _productRepository.getProduct(productId);
    response.fold(
      (product) => emit(ProductDetailState.loaded(product)),
      (error) => emit(ProductDetailState.error(error)),
    );
  }
}
