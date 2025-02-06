import 'package:auto_route/auto_route.dart';
import 'package:blocs/blocs.dart';
import 'package:common/common.dart';
import 'package:design/design.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget implements AutoRouteWrapper {
  const ProductDetailPage({
    super.key,
    @PathParam() required this.productId,
  });

  final String productId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
        getIt<ProductRepository>(),
      )..getProduct(productId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          return _buildMainContent(state);
        },
      ),
    );
  }

  Widget _buildMainContent(ProductDetailState state) {
    return state.maybeWhen(
      orElse: _buildLoading,
      loaded: _buildLoaded,
    );
  }

  Widget _buildLoading() {
    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Shimmer(
            child: ShimmerLoading(
              isLoading: true,
              child: Card.filled(
                margin: EdgeInsets.zero,
                child: SizedBox(height: 32, width: 200),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Shimmer(
                child: ShimmerLoading(
                  isLoading: true,
                  child: Card.filled(
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Shimmer(
                child: ShimmerLoading(
                  isLoading: true,
                  child: Card.filled(
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 32,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Shimmer(
                child: ShimmerLoading(
                  isLoading: true,
                  child: Card.filled(
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 24,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Shimmer(
                child: ShimmerLoading(
                  isLoading: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card.filled(
                        margin: EdgeInsets.zero,
                        child: Container(
                          height: 24,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const Gap(8),
                      Card.filled(
                        margin: EdgeInsets.zero,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildLoaded(Product product) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(product.name),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            32,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              const Gap(16),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(16),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(8),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const Gap(16),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
