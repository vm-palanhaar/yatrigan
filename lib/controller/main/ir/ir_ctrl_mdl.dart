import 'package:flutter/material.dart';
import 'package:yatrigan/model/main/ir/station/ir_station_list_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/info/ir_shop_info_res_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shop_list_obj_res_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shops_list_res_mdl.dart';
import 'package:yatrigan/model/main/ir/train/ir_train_list_res_mdl.dart';

class IrCtrlMdl extends ChangeNotifier {
  IrStationListMdl? stationList;
  String stationCode = '';
  String stationName = '';

  IrShopListResMdl? shops;
  // selected shop
  IrShopListObjResMdl? shop;
  IrShopInfoResMdl? shopInfo;

  IrTrainListResMdl? trainList;
  String trainNo = '';
  String trainName = '';
}
