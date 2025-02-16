import 'package:blocs/blocs.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/src/widgets/text_form_field_widget.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldWidget(
              controller: _emailController,
              labelText: context.l10n.email,
              hintText: context.l10n.emailHint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.emailError;
                }
                if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(value)) {
                  return context.l10n.emailInvalid;
                }
                return null;
              },
            ),
            const Gap(16),
            TextFormFieldWidget(
              controller: _passwordController,
              labelText: context.l10n.password,
              hintText: context.l10n.passwordHint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.passwordError;
                }
                return null;
              },
              obscureText: _obscureText,
              isObscure: true,
              onObscureButtonPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const Gap(16),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<OnboardingSessionCubit>().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                }
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: Text(context.l10n.signIn),
            ),
            const Gap(8),
            TextButton(
              onPressed: () {},
              child: Text(context.l10n.forgotPassword),
            ),
          ],
        ),
      ),
    );
  }
}
