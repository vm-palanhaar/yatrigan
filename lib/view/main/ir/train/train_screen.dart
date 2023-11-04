import 'package:flutter/material.dart';
import 'package:yatrigan/view/main/ir/train/widgets/ir_trains_search_widget.dart';
import 'package:yatrigan/view/util/app_bar.dart';
import 'package:yatrigan/view/util/margins.dart';

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
                      IrTrainSearchWidget(
                        onSubmitted: () {},
                        title: 'Train Number/Name',
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
