import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_train_catering_tab.dart';
import 'package:yatrigan/view/main/ir/train/screens/ir_train_shdl_tab.dart';
import 'package:yatrigan/view/util/app_bar.dart';

class IrKytScreen extends StatelessWidget {
  const IrKytScreen({super.key});
  static String id = '/yatrigan/ir/train/trainNo/kyt';

  @override
  Widget build(BuildContext context) {
    String trainNo = Provider.of<IrCtrl>(context, listen: false).trainNo;
    String trainName = Provider.of<IrCtrl>(context, listen: false).trainName;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: appBar(
          context: context,
          title: '$trainNo - $trainName',
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Schedule'),
              Tab(text: 'Catering'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrTrainShdlTab(),
            IrTrainCateringTab(),
          ],
        ),
      ),
    );
  }
}
