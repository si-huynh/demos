import 'package:common/src/env.dev.dart';

class Environment {
  Environment({required this.apiBaseUrl});

  factory Environment.dev() {
    return Environment(apiBaseUrl: EnvDev.apiBaseUrl);
  }
  final String apiBaseUrl;
}
