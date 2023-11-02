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
}
