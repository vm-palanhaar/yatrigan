import 'package:yatrigan/model/error_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/info/ir_shop_info_obj_res_mdl.dart';

class IrShopInfoResMdl {
  final String shopId;
  final IrShopInfoObjResMdl? shop;
  final ErrorMdl? error;

  IrShopInfoResMdl({
    required this.shopId,
    this.shop,
    this.error,
  });

  factory IrShopInfoResMdl.success(Map<String, dynamic> json) {
    return IrShopInfoResMdl(
      shopId: json["shopId"] as String,
      shop: IrShopInfoObjResMdl.fromJson(json['info']),
    );
  }

  factory IrShopInfoResMdl.fail(Map<String, dynamic> json) {
    return IrShopInfoResMdl(
      shopId: json["shopId"] as String,
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
