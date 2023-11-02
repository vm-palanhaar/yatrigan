import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:yatrigan/controller/handle_errors_api.dart';
import 'package:yatrigan/controller/rest_api.dart';
import 'package:yatrigan/model/main/ir/ir_station_list_mdl.dart';
import 'package:yatrigan/model/main/ir/station/shops/list/ir_shops_list_res_mdl.dart';

class IrCtrlApi extends HandleErrorsApi {
  late String _token;
  void setToken(String token) => _token = token;

  Future<IrStationListMdl?> getStationListApi({
    required BuildContext context,
    required bool showError,
  }) async {
    super.context = context;
    super.showError = showError;
    IrStationListMdl? res;
    if (await checkInternetConnectivity()) {
      var response = await http.get(
        Uri.parse(IrApiUri.stations.uri),
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = IrStationListMdl.fromJson(json);
      }
      //TODO: Handle errors if not response not serialized
    }
    return res;
  }

  Future<IrShopsListResMdl?> getShopListApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
  }) async {
    super.context = context;
    super.showError = showError;
    IrShopsListResMdl? res;
    if (await checkInternetConnectivity()) {
      String uri = IrApiUri.stationShopList.uri;
      uri = uri.replaceAll("<code>", stationCode);
      var response = await http.get(
        Uri.parse(uri),
      );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = IrShopsListResMdl.success(json);
      } else if (response.statusCode == 400) {
        res = IrShopsListResMdl.fail(json);
      }
      //TODO: Handle errors if not response not serialized
    }
    return res;
  }
}
