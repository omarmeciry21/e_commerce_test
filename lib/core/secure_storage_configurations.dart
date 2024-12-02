import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class SecureStorageConfigurations {
  static const String _tokenKey = 'user_token';

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static final FlutterSecureStorage _storage =
      FlutterSecureStorage(aOptions: _getAndroidOptions());

  static Future<void> saveUserToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> clearUserToken() async {
    await _storage.delete(key: _tokenKey);
    // await clearBiometricsToken();
  }
}
