import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shop_list_obj_res_mdl.dart';
import 'package:yatrigan/view/widgets/text_widget.dart';

class IrShopListButtonWidget extends StatefulWidget {
  final IrShopListObjResMdl irShop;
  final int index;
  final Function onTap;
  const IrShopListButtonWidget({
    super.key,
    required this.irShop,
    required this.index,
    required this.onTap,
  });

  @override
  State<IrShopListButtonWidget> createState() => _IrShopListButtonWidgetState();
}

class _IrShopListButtonWidgetState extends State<IrShopListButtonWidget> {
  late IrCtrl irCtrl;
  @override
  void initState() {
    irCtrl = Provider.of<IrCtrl>(context, listen: false);
    super.initState();
  }

  Widget shopImgWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.009,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            widget.irShop.shopImg,
          ),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget shopInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Stall Number: ${widget.irShop.shopNo}'),
        if (widget.irShop.getPlt().isNotEmpty)
          Text('Platform: ${widget.irShop.getPlt()}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      shopImgWidget(),
                      TextWidget(
                        text: widget.irShop.shopName,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          shopInfoWidget(),
                          Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.irShop.isOpen ? 'Open' : 'Closed',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.irShop.isOpen
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
