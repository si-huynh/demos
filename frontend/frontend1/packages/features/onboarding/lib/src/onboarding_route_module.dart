import 'package:auto_route/auto_route.dart';

import 'onboarding_route_module.gr.dart';

@AutoRouterConfig()
class OnboardingRouteModule extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: DashboardRoute.page, initial: true),
      ];
}
