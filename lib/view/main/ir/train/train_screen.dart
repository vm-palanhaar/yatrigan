import 'package:flutter/material.dart';
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
        title: 'Train/Station(s)',
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
