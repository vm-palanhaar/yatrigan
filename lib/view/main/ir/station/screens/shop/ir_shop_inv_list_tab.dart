import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';

class IrShopInvListTab extends StatefulWidget {
  const IrShopInvListTab({super.key});

  @override
  State<IrShopInvListTab> createState() => _IrShopInvListTabState();
}

class _IrShopInvListTabState extends State<IrShopInvListTab> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CTextErrorWidget(
      text: 'Stay tuned for more exciting features.',
    );
  }
}
