import 'package:auto_route/auto_route.dart';
import 'package:blocs/blocs.dart';
import 'package:common/common.dart';
import 'package:design/design.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:products/src/widgets/product_card_widget.dart';

@RoutePage()
class ProductHomePage extends StatelessWidget implements AutoRouteWrapper {
  const ProductHomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductHomeCubit(
        getIt<ProductRepository>(),
      )..getProducts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductHomeCubit, ProductHomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<ProductHomeCubit>().getProducts();
            },
            child: CustomScrollView(
              slivers: [
                const SliverAppBar.large(
                  title: Text('Products'),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    context.paddingBottom,
                  ),
                  sliver: _buildMainContent(state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent(ProductHomeState state) {
    return state.maybeWhen(
      orElse: _buildLoadingGrid,
      loaded: _buildGridOfProducts,
    );
  }

  Widget _buildGridOfProducts(List<Product> products) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) =>
          ProductCardWidget(product: products[index]),
      itemCount: products.length,
    );
  }

  Widget _buildLoadingGrid() {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => Shimmer(
        child: ShimmerLoading(
          isLoading: true,
          child: Card.filled(
            margin: EdgeInsets.zero,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      itemCount: 10,
    );
  }
}
