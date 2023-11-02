import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/view/util/margins.dart';
import 'package:yatrigan/view/widgets/ctext_error_widget.dart';
import 'package:yatrigan/view/widgets/loading_widget.dart';
import 'package:yatrigan/view/widgets/text_widget.dart';

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
    getShopInfo();
    super.initState();
  }

  Future<void> getShopInfo() async {
    await ctrl.getShopInfoApi(context: context);
    setState(() {});
  }

  Widget shopImgWidget() {
    return Card(
      child: CachedNetworkImage(
        imageUrl: ctrl.shopInfo!.shop!.shopImg,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget shopBasicInfoWidget() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.store_outlined),
            title: Text('${ctrl.shopInfo!.shop!.shopName} '
                '(${ctrl.shopInfo!.shop!.shopNo})'),
            subtitle: const Text('Stall Name (Stall No)'),
          ),
          if (ctrl.shopInfo!.shop!.getPlt().isNotEmpty)
            ListTile(
              leading: const Icon(Icons.location_pin),
              title: Text('Platform: ${ctrl.shopInfo!.shop!.getPlt()}'),
            ),
          ListTile(
            leading: const Icon(Icons.contact_phone_outlined),
            title: Text(ctrl.shopInfo!.shop!.contactNo),
            subtitle: const Text('Contact Number'),
            trailing: const Icon(Icons.call),
            onTap: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: '+91${ctrl.shopInfo!.shop!.contactNo}',
              );
              await launchUrl(launchUri);
            },
          ),
        ],
      ),
    );
  }

  Widget shopPaymentWidget() {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.currency_rupee_outlined),
            ),
            title: TextWidget(
              text: 'Payment Modes',
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.money_outlined),
            title: const Text('Cash'),
            trailing: payment(ctrl.shopInfo!.shop!.isCash),
          ),
          ListTile(
            leading: const Icon(Icons.qr_code_outlined),
            title: const Text('UPI'),
            trailing: payment(ctrl.shopInfo!.shop!.isUpi),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card_outlined),
            title: const Text('Card'),
            trailing: payment(ctrl.shopInfo!.shop!.isCard),
          ),
        ],
      ),
    );
  }

  Icon payment(bool paymentMethod) {
    if (paymentMethod) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ctrl.shopInfo != null && ctrl.shopInfo!.shopId == ctrl.shop!.id) {
      if (ctrl.shopInfo!.shop != null) {
        return RefreshIndicator(
          onRefresh: () async => getShopInfo(),
          child: SingleChildScrollView(
            child: Container(
              margin: screenMargin(context),
              child: Column(
                children: <Widget>[
                  shopImgWidget(),
                  shopBasicInfoWidget(),
                  shopPaymentWidget(),
                ],
              ),
            ),
          ),
        );
      } else if (ctrl.shopInfo!.error != null) {
        return CTextErrorWidget(text: ctrl.shopInfo!.error!.msg);
      }
    }
    return const LoadingWidget();
  }
}
