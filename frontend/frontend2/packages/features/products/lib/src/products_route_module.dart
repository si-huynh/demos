import 'package:auto_route/auto_route.dart';

import 'products_route_module.gr.dart';

@AutoRouterConfig()
class ProductsRouteModule extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductHomeRoute.page, initial: true),
        AutoRoute(page: ProductDetailRoute.page),
      ];
}
