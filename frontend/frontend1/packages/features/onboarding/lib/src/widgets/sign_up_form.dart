import 'package:blocs/blocs.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/src/widgets/text_form_field_widget.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    controller: _firstNameController,
                    labelText: context.l10n.firstName,
                    hintText: context.l10n.firstNameHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.l10n.firstNameError;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z]'),
                      ),
                    ],
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: TextFormFieldWidget(
                    controller: _lastNameController,
                    labelText: context.l10n.lastName,
                    hintText: context.l10n.lastNameHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.l10n.lastNameError;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z]'),
                      ),
                    ],
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
              ],
            ),
            const Gap(16),
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
              isObscure: true,
              obscureText: _obscureText,
              onObscureButtonPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.passwordError;
                }
                return null;
              },
            ),
            const Gap(16),
            TextFormFieldWidget(
              controller: _confirmPasswordController,
              labelText: context.l10n.confirmPassword,
              hintText: context.l10n.confirmPasswordHint,
              isObscure: true,
              obscureText: _obscureText,
              onObscureButtonPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.confirmPasswordError;
                }
                if (value != _passwordController.text) {
                  return context.l10n.confirmPasswordNotMatch;
                }
                return null;
              },
            ),
            const Gap(16),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<OnboardingSessionCubit>().signUp(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                }
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: Text(context.l10n.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
