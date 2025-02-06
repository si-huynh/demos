import 'package:envied/envied.dart';

part 'env.dev.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'apiBaseUrl')
  static const String apiBaseUrl = _EnvDev.apiBaseUrl;
}
