import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  static String id = '/yatrigan/ir/wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Wallet',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
