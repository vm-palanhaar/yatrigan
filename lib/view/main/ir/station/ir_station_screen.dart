import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/util/app_bar.dart';

class IrStationScreen extends StatelessWidget {
  const IrStationScreen({super.key});
  static String id = '/yatrigan/ir/station/code';

  @override
  Widget build(BuildContext context) {
    String stationName =
        Provider.of<IrCtrl>(context, listen: false).railStationName;
    String stationCode =
        Provider.of<IrCtrl>(context, listen: false).railStationCode;
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: appBar(
          context: context,
          title: ' $stationName - $stationCode',
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(),
          ],
        ),
      ),
    );
  }
}
