import 'localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeToOnboardingWorkspace => 'Welcome to Onboarding Workspace';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get createNewAccount => 'Create new account';

  @override
  String get notHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get signIn => 'Sign in';

  @override
  String get firstName => 'First name';

  @override
  String get firstNameError => 'First name is required';

  @override
  String get lastName => 'Last name';

  @override
  String get lastNameError => 'Last name is required';

  @override
  String get firstNameHint => 'Enter your first name';

  @override
  String get lastNameHint => 'Enter your last name';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get emailError => 'Email is required';

  @override
  String get emailInvalid => 'Email is invalid';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get passwordError => 'Password is required';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get confirmPasswordHint => 'Enter your confirm password';

  @override
  String get confirmPasswordError => 'Confirm password is required';

  @override
  String get confirmPasswordNotMatch => 'Confirm password not match';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get loginSuccessful => 'Login successful';

  @override
  String get registerSuccessful => 'Register successful';
}
