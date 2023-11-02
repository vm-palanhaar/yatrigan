import 'package:yatrigan/model/error_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shop_list_obj_res_mdl.dart';

class IrShopListResMdl {
  final String station;
  final List<IrShopListObjResMdl> shop;
  final ErrorMdl? error;

  IrShopListResMdl({
    required this.station,
    required this.shop,
    required this.error,
  });

  factory IrShopListResMdl.success(Map<String, dynamic> json) {
    var data = json['shops'] as List;
    List<IrShopListObjResMdl> list = data
        .map<IrShopListObjResMdl>(
          (json) => IrShopListObjResMdl.fromJson(json),
        )
        .toList();
    return IrShopListResMdl(
      station: json["station"] as String,
      shop: list,
      error: null,
    );
  }

  factory IrShopListResMdl.fail(Map<String, dynamic> json) {
    return IrShopListResMdl(
      station: json["station"] as String,
      shop: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
