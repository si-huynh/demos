import 'localization.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get welcomeToOnboardingWorkspace => 'Chào mừng đến với Onboarding Workspace';

  @override
  String get haveAccount => 'Đã có tài khoản?';

  @override
  String get createNewAccount => 'Tạo tài khoản mới';

  @override
  String get notHaveAccount => 'Không có tài khoản?';

  @override
  String get signUp => 'Đăng ký';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get firstName => 'Họ';

  @override
  String get firstNameError => 'Vui lòng nhập họ của bạn';

  @override
  String get lastName => 'Tên';

  @override
  String get lastNameError => 'Vui lòng nhập tên của bạn';

  @override
  String get firstNameHint => 'Nhập họ của bạn';

  @override
  String get lastNameHint => 'Nhập tên của bạn';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Nhập email của bạn';

  @override
  String get emailError => 'Email là bắt buộc';

  @override
  String get emailInvalid => 'Email không hợp lệ';

  @override
  String get password => 'Mật khẩu';

  @override
  String get passwordHint => 'Nhập mật khẩu của bạn';

  @override
  String get passwordError => 'Mật khẩu là bắt buộc';

  @override
  String get confirmPassword => 'Xác nhận mật khẩu';

  @override
  String get confirmPasswordHint => 'Nhập xác nhận mật khẩu của bạn';

  @override
  String get confirmPasswordError => 'Xác nhận mật khẩu là bắt buộc';

  @override
  String get confirmPasswordNotMatch => 'Xác nhận mật khẩu không khớp';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get loginSuccessful => 'Đăng nhập thành công';

  @override
  String get registerSuccessful => 'Đăng ký thành công';
}
