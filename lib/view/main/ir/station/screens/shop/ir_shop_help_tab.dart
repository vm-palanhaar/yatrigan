import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/opt_widget.dart';

class IrShopHelpTab extends StatefulWidget {
  const IrShopHelpTab({super.key});

  @override
  State<IrShopHelpTab> createState() => _IrShopHelpTabState();
}

class _IrShopHelpTabState extends State<IrShopHelpTab> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: screenMargin(context),
      child: CustomScrollView(
        slivers: [
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              OptWidget(
                icon: Icons.currency_rupee,
                title: 'Overcharging',
                onTap: () {},
              ),
              OptWidget(
                icon: Icons.room_service,
                title: 'Service Quality & Hygiene',
                onTap: () {},
              ),
              OptWidget(
                icon: Icons.high_quality,
                title: 'Food Quality',
                onTap: () {},
              ),
              OptWidget(
                icon: Icons.monitor_weight,
                title: 'Food Quantity',
                onTap: () {},
              ),
              OptWidget(
                icon: Icons.no_food,
                title: 'Food & Water Not Available',
                onTap: () {},
              ),
              OptWidget(
                icon: Icons.numbers,
                title: 'Others',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
