import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/main/ir/station/screens/shop/ir_shop_help_tab.dart';
import 'package:yatrigan/view/main/ir/station/screens/shop/ir_shop_info_tab.dart';
import 'package:yatrigan/view/main/ir/station/screens/shop/ir_shop_inv_list_tab.dart';
import 'package:yatrigan/view/util/app_bar.dart';

class IrShopScreen extends StatelessWidget {
  const IrShopScreen({super.key});
  static String id = '/yatrigan/ir/station/code/stall/id';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: appBar(
          context: context,
          title: Provider.of<IrCtrl>(context, listen: false).shop!.shopName,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.inventory_2_outlined), text: 'Inventory'),
              Tab(icon: Icon(Icons.info_outline), text: 'Info'),
              Tab(icon: Icon(Icons.help_outline), text: 'Help'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrShopInvListTab(),
            IrShopInfoTab(),
            IrShopHelpTab(),
          ],
        ),
      ),
    );
  }
}
