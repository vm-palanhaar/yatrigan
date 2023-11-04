import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

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
      body: Container(
        margin: screenMargin(context),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CTextErrorWidget(
              text: 'PNR Status',
            ),
            CTextErrorWidget(
              text: 'List train booked tickets, and associated services booked',
            ),
          ],
        ),
      )
    );
  }
}
