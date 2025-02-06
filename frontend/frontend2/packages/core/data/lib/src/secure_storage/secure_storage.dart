import 'package:common/common.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@singleton
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
            );

  final FlutterSecureStorage _storage;

  Future<Map<String, String>> allValues() => _storage.readAll();

  Future<void> deleteAll() => _storage.deleteAll();

  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<String?> read(String key) => _storage.read(key: key);

  Future<void> delete(String key) => _storage.delete(key: key);

  static const kUserLoggedIn = 'kUserLoggedIn';
  static const kDeviceName = 'kDeviceName';

  Future<void> initialize() async {
    final isUserLoggedIn = await read(kUserLoggedIn);
    if (isUserLoggedIn != null && isUserLoggedIn == 'true') {
      // Everything is ready, nothing to do.
      return;
    }

    // Get Device Name & save to storage
    if (await read(kDeviceName) == null) {
      final deviceInfo = DeviceInfoPlugin();
      var deviceName = 'Unknown';

      if (defaultTargetPlatform == TargetPlatform.android) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.model;
      }
      write(kDeviceName, deviceName);
    }
  }
}
