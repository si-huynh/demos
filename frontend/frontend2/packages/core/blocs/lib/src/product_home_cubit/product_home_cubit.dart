import 'package:blocs/blocs.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'product_home_cubit.freezed.dart';
part 'product_home_state.dart';

class ProductHomeCubit extends Cubit<ProductHomeState> {
  ProductHomeCubit(this._productRepository)
      : super(const ProductHomeState.initial());

  final ProductRepository _productRepository;

  Future<void> getProducts() async {
    emit(const ProductHomeState.loading());
    final products = await _productRepository.getProducts();
    emit(ProductHomeState.loaded(products));
  }
}
