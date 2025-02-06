import 'package:auto_route/auto_route.dart';
import 'package:blocs/blocs.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onboarding/src/onboarding_route_module.gr.dart';
import 'package:onboarding/src/widgets/sign_up_form.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingSessionCubit, OnboardingSessionState>(
      listener: (context, state) {
        switch (state.status) {
          case OnboardingSessionStatus.loading:
            context.loaderOverlay.show();
            break;
          case OnboardingSessionStatus.success:
            context.loaderOverlay.hide();
            _showMessage(context, context.l10n.registerSuccessful);
            break;
          case OnboardingSessionStatus.failure:
            context.loaderOverlay.hide();
            _showMessage(context, state.errorMessage!);
            break;
          case OnboardingSessionStatus.initial:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.createNewAccount,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.haveAccount,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        if (context.router.stack
                            .any((route) => route.name == SignInRoute.name)) {
                          context.router.navigate(const SignInRoute());
                        } else {
                          context.router.push(const SignInRoute());
                        }
                      },
                      child: Text(
                        context.l10n.signIn,
                      ),
                    ),
                  ],
                ),
                const SignUpForm(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
