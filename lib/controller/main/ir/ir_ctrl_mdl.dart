import 'package:flutter/material.dart';
import 'package:yatrigan/model/main/ir/ir_station_list_mdl.dart';

class IrCtrlMdl extends ChangeNotifier {
  IrStationListMdl? stationList;

  String railStationCode = '';
  String railStationName = '';
}