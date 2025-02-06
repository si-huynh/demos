import 'localization.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get products => 'Sản phẩm';

  @override
  String get loading => 'Đang tải...';

  @override
  String get out_of_stock => 'Hết hàng';

  @override
  String get in_stock => 'Còn hàng';

  @override
  String get add_to_cart => 'Thêm vào giỏ hàng';
}
