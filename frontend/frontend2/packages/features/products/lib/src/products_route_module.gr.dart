// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:products/src/pages/product_detail_page.dart' as _i1;
import 'package:products/src/pages/product_home_page.dart' as _i2;

/// generated route for
/// [_i1.ProductDetailPage]
class ProductDetailRoute extends _i3.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i4.Key? key,
    required String productId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(key: key, productId: productId),
         rawPathParams: {'productId': productId},
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProductDetailRouteArgs>(
        orElse:
            () => ProductDetailRouteArgs(
              productId: pathParams.getString('productId'),
            ),
      );
      return _i3.WrappedRoute(
        child: _i1.ProductDetailPage(key: args.key, productId: args.productId),
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.productId});

  final _i4.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i2.ProductHomePage]
class ProductHomeRoute extends _i3.PageRouteInfo<void> {
  const ProductHomeRoute({List<_i3.PageRouteInfo>? children})
    : super(ProductHomeRoute.name, initialChildren: children);

  static const String name = 'ProductHomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.ProductHomePage());
    },
  );
}
