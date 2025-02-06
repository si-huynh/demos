import 'dart:async';

import 'package:configuration/configuration.dart';
import 'package:flutter/material.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await const AppConfiguration().initializeAndRunApp();
}
