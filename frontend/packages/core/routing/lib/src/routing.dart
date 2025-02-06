import 'package:auto_route/auto_route.dart';
import 'package:onboarding/onboarding.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes {
    return [
      ...OnboardingRouteModule().routes,
      // CustomRoute(
      //   page: HomeRoute.page,
      //   path: '/home',
      //   children: [
      //     AutoRoute(
      //       page: NotificationHomeTabRoute.page,
      //       path: 'notifications',
      //       initial: appFlavor != 'Prod',
      //       children: NotificationsRouteModule().routes,
      //     ),
      //     AutoRoute(
      //       page: TransactionHomeTabRoute.page,
      //       path: 'charges',
      //       initial: appFlavor! == 'Prod',
      //       children: TransactionRouteModule().routes,
      //     ),
      //     AutoRoute(
      //       page: UserPoliciesHomeTabRoute.page,
      //       path: 'policies',
      //       children: UserPolicyRouteModule().routes,
      //     ),
      //   ],
      //   transitionsBuilder: CustomTransitions.fadeThroughTransitionBuilder,
      // ),
      // CustomRoute(
      //   page: LocalSecurityRoute.page,
      //   transitionsBuilder: CustomTransitions.fadeThroughTransitionBuilder,
      // ),
    ];
  }
}
