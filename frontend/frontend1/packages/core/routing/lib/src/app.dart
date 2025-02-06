import 'dart:ui';

import 'package:blocs/blocs.dart';
import 'package:common/common.dart';
import 'package:design/design.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:routing/src/routing.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt<UserRepository>()),
      ],
      child: BlocProvider(
        create: (context) => OnboardingSessionCubit(
          getIt<UserRepository>(),
        ),
        child: _buildAppContent(context),
      ),
    );
  }

  Widget _buildAppContent(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.transparent,
      overlayWidgetBuilder: _buildLoaderOverlay,
      child: _buildMaterialAppRouter(context),
    );
  }

  Widget _buildMaterialAppRouter(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => [HeroController()],
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  Widget _buildLoaderOverlay(progress) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4.5,
        sigmaY: 4.5,
      ),
      child: Center(
        child: SizedBox(
          width: 56,
          height: 56,
          child: CircularProgressIndicator(
            color: MaterialTheme.lightScheme().primary,
          ),
        ),
      ),
    );
  }
}
