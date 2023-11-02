import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';

class IrShopInfoTab extends StatefulWidget {
  const IrShopInfoTab({super.key});

  @override
  State<IrShopInfoTab> createState() => _IrShopInfoTabState();
}

class _IrShopInfoTabState extends State<IrShopInfoTab> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
