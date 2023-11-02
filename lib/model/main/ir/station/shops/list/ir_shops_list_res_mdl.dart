import 'package:yatrigan/model/error_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shop_list_obj_res_mdl.dart';

class IrShopsListResMdl {
  final String station;
  final List<IrShopListObjResMdl> shop;
  final ErrorMdl? error;

  IrShopsListResMdl({
    required this.station,
    required this.shop,
    required this.error,
  });

  factory IrShopsListResMdl.success(Map<String, dynamic> json) {
    var data = json['shops'] as List;
    List<IrShopListObjResMdl> list = data
        .map<IrShopListObjResMdl>(
          (json) => IrShopListObjResMdl.fromJson(json),
        )
        .toList();
    return IrShopsListResMdl(
      station: json["station"] as String,
      shop: list,
      error: null,
    );
  }

  factory IrShopsListResMdl.fail(Map<String, dynamic> json) {
    return IrShopsListResMdl(
      station: json["station"] as String,
      shop: [],
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}
