import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shop_list_obj_res_mdl.dart';
import 'package:yatrigan/view/main/ir/station/screens/shop/ir_shop_screen.dart';
import 'package:yatrigan/view/main/ir/station/widgets/shop/ir_shop_list_button_widget.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';
import 'package:yatrigan/view/widgets/loading_widget.dart';

class IrShopListTab extends StatefulWidget {
  const IrShopListTab({super.key});

  @override
  State<IrShopListTab> createState() => _IrShopListTabState();
}

class _IrShopListTabState extends State<IrShopListTab> {
  late IrCtrl ctrl;
  @override
  void initState() {
    ctrl = Provider.of<IrCtrl>(context, listen: false);
    getStationShopList();
    super.initState();
  }

  Future<void> getStationShopList() async {
    await ctrl.getShopListApi(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.shops != null && ctrl.shops!.station == ctrl.stationCode) {
      if (ctrl.shops!.shop.isNotEmpty) {
        return RefreshIndicator(
          onRefresh: () async => await getStationShopList(),
          child: Container(
            margin: screenMargin(context),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: ctrl.shops!.shop.length,
                  separatorBuilder: (context, index) {
                    if (index != ctrl.shops!.shop.length - 1) {
                      return const Divider();
                    }
                    return null;
                  },
                  itemBuilder: (context, index) {
                    IrShopListObjResMdl irShop =
                        ctrl.shops!.shop.elementAt(index);
                    return IrShopListButtonWidget(
                      key: ObjectKey(irShop),
                      irShop: irShop,
                      index: index,
                      onTap: () {
                        ctrl.shop = irShop;
                        Navigator.pushNamed(context, IrShopScreen.id);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else if (ctrl.shops!.error != null) {
        return CTextErrorWidget(text: ctrl.shops!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
