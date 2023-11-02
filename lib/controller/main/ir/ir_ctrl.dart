import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl_api.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl_mdl.dart';

class IrCtrl extends IrCtrlMdl {
  final IrCtrlApi _api = IrCtrlApi();

  Future<void> getStationListApi({
    required BuildContext context,
  }) async {
    if (stationList == null || stationList!.stations.isEmpty) {
      stationList = await _api.getStationListApi(
        context: context,
        showError: true,
      );
      notifyListeners();
    }
  }

  Future<void> getShopListApi({
    required BuildContext context,
  }) async {
    if (stationCode.isNotEmpty) {
      shops = null;
      shops = await _api.getShopListApi(
        context: context,
        showError: true,
        stationCode: stationCode,
      );
      notifyListeners();
    }
  }

  Future<void> getShopInfoApi({
    required BuildContext context,
  }) async {
    if (shopInfo == null || shopInfo!.shopId != shop!.id) {
      shopInfo = await _api.getShopInfoApi(
        context: context,
        showError: true,
        stationCode: stationCode,
        shop: shop!,
      );
    }
  }

  Future<void> getTrainListApi({
    required BuildContext context,
  }) async {
    if (trainList == null || trainList!.train.isEmpty) {
      trainList = await _api.getTrainListApi(
        context: context,
        showError: true,
      );
      notifyListeners();
    }
  }
}
