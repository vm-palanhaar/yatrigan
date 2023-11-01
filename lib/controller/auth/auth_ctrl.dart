import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yatrigan/controller/auth/auth_ctrl_mdl.dart';

class AuthCtrl extends AuthCtrlMdl {
  BuildContext? context;

  AuthCtrl({this.context});

  // read all key-value
  Future<void> readAllKeys() async {
    for (String key in getAppKeys) {
      final x = await storage.read(
        key: key,
        aOptions: getAndroidOptions(),
      );
      if (x != null) {
        appKeys[key] = x;
      }
    }
  }

  // delete all key-value
  Future<void> deleteAllKeys() async {
    for (String key in getAppKeys) {
      await storage.delete(
        key: key,
        aOptions: getAndroidOptions(),
      );
    }
    userLoggedIn = -1;
  }

  // read key-value
  Future<String?> readKey({
    required String key,
  }) async {
    return await storage.read(
      key: key,
      aOptions: getAndroidOptions(),
    );
  }

  // write key-value
  Future<void> writeKey({
    required String key,
    required String value,
  }) async {
    await storage.write(
      key: key,
      value: value,
      aOptions: getAndroidOptions(),
    );
  }

  Future<void> getUserSkip({
    required BuildContext context,
  }) async {
    this.context = context;
    String? skip = await readKey(key: AppKey.skip.key);
    if (skip != null) {
      appKeys[AppKey.skip.key] = skip;
      if (skip.contains('1')) {
        userLoggedIn = -1;
      } else {
        userLoggedIn = 0;
        await getUserLoggedIn();
      }
      return;
    }
    await writeKey(key: AppKey.skip.key, value: '1');
    userLoggedIn = -1;
  }

  Future<void> getUserLoggedIn() async {
    String? token = await readKey(key: AppKey.token.key);
    if (token != null) {
      appKeys[AppKey.token.key] = token;
      await getUserLoggedInApi();
      return;
    }
    userLoggedIn = 0;
  }

  Future<void> getUserLoggedInApi() async {
    if (appKeys[AppKey.token.key] != null) {
      /*String res = await _authApi.getUserLoggedInValidApi(
        context: context!,
        token: appKeys[AppKey.token.key]!,
        showError: true,
      );
      if (res.isNotEmpty) {
        userLoggedIn = 1;
        await writeKey(key: AppKey.token.key, value: res);
        await readAllKeys();
        return;
      }*/
    }
    userLoggedIn = 0;
  }

  void navigateFromSplashScreen() {
    switch (userLoggedIn) {
      case -1:
        //TODO: main view
        Navigator.pushReplacementNamed(context!, 'routeName');
        break;
      case 0:
        //TODO: init view
        Navigator.pushReplacementNamed(context!, 'routeName');
        break;
      case 1:
        //TODO: main view
        Navigator.pushReplacementNamed(context!, 'routeName');
        break;
    }
  }
}
