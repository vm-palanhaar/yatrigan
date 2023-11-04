import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yatrigan/model/main/ir/station/ir_station_list_mdl.dart';
import 'package:yatrigan/model/main/ir/train/ir_train_list_mdl.dart';

class IrCtrlDb {
  static const String _dbName = 'indRail';
  late BoxCollection _irDb;
  static const String _searchTrainField = 'searchTrain';
  late CollectionBox _trainBox;
  static const String _searchStationField = 'searchStation';
  late CollectionBox _stationBox;

  Future<void> getDb() async {
    final directory = await getApplicationDocumentsDirectory();
    _irDb = await BoxCollection.open(
      _dbName,
      path: directory.path,
      {'train', 'station', 'reservedTicket'},
    );
    _trainBox = await _irDb.openBox<Map>('train');
    _stationBox = await _irDb.openBox<Map>('station');
  }

  Future<IrTrainListMdl?> getSearchTrainListDb() async {
    IrTrainListMdl? res;
    final keyList = await _trainBox.getAllKeys();
    if (keyList.contains(_searchTrainField)) {
      final list = await _trainBox.get(_searchTrainField);
      res = IrTrainListMdl(
        lenSt: list?['len'],
        trains: list?['trainList'],
      );
    }
    return res;
  }

  Future<void> postSearchTrainListDb({
    required IrTrainListMdl trainList,
  }) async {
    await _stationBox.put(
      _searchTrainField,
      {'trainList': trainList.trains, 'len': trainList.lenSt},
    );
  }

  Future<IrStationListMdl?> getSearchStationListDb() async {
    IrStationListMdl? res;
    final keyList = await _stationBox.getAllKeys();
    if (keyList.contains(_searchStationField)) {
      final list = await _stationBox.get(_searchStationField);
      res = IrStationListMdl(
        lenSt: list?['len'],
        stations: list?['stationList'],
      );
    }
    return res;
  }

  Future<void> postSearchStationListDb({
    required IrStationListMdl stationList,
  }) async {
    await _stationBox.put(
      _searchStationField,
      {'stationList': stationList.stations, 'len': stationList.lenSt},
    );
  }
}
