part of 'product_home_cubit.dart';

@freezed
class ProductHomeState with _$ProductHomeState {
  const factory ProductHomeState.initial() = _Initial;
  const factory ProductHomeState.loading() = _Loading;
  const factory ProductHomeState.loaded(List<Product> products) = _Loaded;
  const factory ProductHomeState.error(String message) = _Error;
}
