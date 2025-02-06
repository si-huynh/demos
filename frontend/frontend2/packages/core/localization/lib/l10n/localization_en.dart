import 'localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get products => 'Products';

  @override
  String get loading => 'Loading...';

  @override
  String get out_of_stock => 'Out of stock';

  @override
  String get in_stock => 'In stock';

  @override
  String get add_to_cart => 'Add to cart';
}
