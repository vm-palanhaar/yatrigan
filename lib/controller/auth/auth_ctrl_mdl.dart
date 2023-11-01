import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCtrlMdl extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final List<String> _appKeys = [
    AppKey.username.key,
    AppKey.token.key,
  ];

  List<String> get getAppKeys => _appKeys;

  Map<String, String> appKeys = {};

  /*
  -1 - not logged in -> navigate to init screen
  0 - skip user login -> navigate to main screen
  1 - success logged in -> navigate to main screen
   */
  int userLoggedIn = -1;
}

enum AppKey {
  /*
  user preferred not to login and proceed to app
  0 - no -> navigate to init screen and check for token
  1 - yes -> navigate to main screen
   */
  skip(key: 'ipytr_user_skip'),
  username(key: 'ipytr_user_username'),
  token(key: 'ipytr_user_token');

  const AppKey({
    required this.key,
  });

  final String key;
}
