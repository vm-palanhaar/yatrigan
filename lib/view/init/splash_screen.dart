import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/auth/auth_ctrl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = '/yatrigan/init';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUserLoggedIn();
    super.initState();
  }

  void getUserLoggedIn() async {
    AuthCtrl ctrl = Provider.of<AuthCtrl>(context, listen: false);
    await ctrl.getUserSkip(context: context);
    ctrl.navigateFromSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/yatrigan.png',
          height: MediaQuery.of(context).size.height * 0.21,
        ),
      ),
    );
  }
}
