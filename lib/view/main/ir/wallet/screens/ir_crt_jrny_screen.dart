import 'package:flutter/material.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_train_catering_tab.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_train_help_tab.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_train_status_tab.dart';
import 'package:yatrigan/view/util/app_bar.dart';

class IrCrtJrnyScreen extends StatelessWidget {
  const IrCrtJrnyScreen({super.key});
  static String id = '/yatrigan/ir/train/trainNo/currentJourney';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: appBar(
          context: context,
          title: 'Your trip',
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Train Status'),
              Tab(text: 'Catering'),
              Tab(text: 'Help'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrTrainStatusTab(),
            IrTrainCateringTab(),
            IrTrainHelpTab(),
          ],
        ),
      ),
    );
  }
}
