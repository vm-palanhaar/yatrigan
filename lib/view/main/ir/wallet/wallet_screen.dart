import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/fields/textformfield_widget.dart';

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
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('PNR Enquiry'),
                      subtitle: TextFormFieldWidget(
                        prefixWidget: const Icon(Icons.sync),
                        keyboardType: TextInputType.number,
                        labelText: 'PNR Number',
                        onFieldSubmitted: () {},
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      )
    );
  }
}
