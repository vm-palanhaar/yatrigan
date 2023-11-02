import 'package:flutter/material.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/fields/ac_textformfield_widget.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});
  static String id = '/yatrigan/ir/train';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Train',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: screenMargin(context),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assets/images/ir/vande_bharat_white.png',
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        title: const Text('Know Your Train (KYT)'),
                      ),
                      AcTextFormFieldWidget(
                        prefixWidget: const Icon(Icons.place_outlined),
                        labelText: 'Search Train',
                        list: const [
                          'NDLS',
                          'CSMT'
                        ], //TODO: Integrate railway stations to this widget
                        onSelect: (String selection) async {
                          /*ctrl.addIrShop.addIrShop3
                              .setStation(selection.split('-')[1].trim());*/
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
