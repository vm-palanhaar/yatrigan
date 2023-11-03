import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl_api.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl_db.dart';
import 'package:yatrigan/controller/main/ir/ir_ctrl_mdl.dart';

class IrCtrl extends IrCtrlMdl {
  late BuildContext context;
  final IrCtrlApi _api = IrCtrlApi();
  final IrCtrlDb _db = IrCtrlDb();

  Future<void> initDb() async {
    await _db.getDb();
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

  Future<void> getTrainShdlApi({
    required BuildContext context,
  }) async {
    if (trainShdl == null || trainShdl!.trainNo != trainNo) {
      trainShdl = await _api.getTrainShdlApi(
        context: context,
        showError: true,
        trainNo: trainNo,
      );
      notifyListeners();
    }
  }

  Future<void> _getSearchTrainListApi() async {
    if (trainList == null || trainList!.trains.isEmpty) {
      trainList = await _api.getSearchTrainListApi(
        context: context,
        showError: true,
      );
      if (trainList != null) {
        await _db.postSearchTrainListDb(trainList: trainList!);
      }
      notifyListeners();
    }
  }

  Future<void> getSearchTrainList({
    required BuildContext context,
  }) async {
    this.context = context;
    trainList = await _db.getSearchTrainListDb();
    if (trainList == null) {
      await _getSearchTrainListApi();
      return;
    }
    notifyListeners();
  }

  Future<void> _getSearchStationListApi() async {
    if (stationList == null || stationList!.stations.isEmpty) {
      stationList = await _api.getSearchStationListApi(
        context: context,
        showError: true,
      );
      if (stationList != null) {
        await _db.postSearchStationListDb(stationList: stationList!);
      }
      notifyListeners();
    }
  }

  Future<void> getSearchStationList({
    required BuildContext context,
  }) async {
    this.context = context;
    stationList = await _db.getSearchStationListDb();
    if (stationList == null) {
      await _getSearchStationListApi();
      return;
    }
    notifyListeners();
  }
}
