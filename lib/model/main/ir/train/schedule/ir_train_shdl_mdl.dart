import 'package:yatrigan/model/main/ir/train/schedule/ir_train_shdl_station_list_mdl.dart';

class IrTrainShdlMdl {
  final String trainNo;
  final String trainName;
  final String daysRun;
  final String duration;
  final String stationFrom;
  final String stationTo;
  List<IrTrainShdlStationListMdl> stations;

  IrTrainShdlMdl({
    required this.trainNo,
    required this.trainName,
    required this.daysRun,
    required this.duration,
    required this.stationFrom,
    required this.stationTo,
    required this.stations,
  });

  factory IrTrainShdlMdl.fromJson(Map<String, dynamic> json) {
    var responseData = json['stationList'] as List;
    List<IrTrainShdlStationListMdl> data = responseData
        .map<IrTrainShdlStationListMdl>(
          (json) => IrTrainShdlStationListMdl.fromJson(json),
        )
        .toList();
    return IrTrainShdlMdl(
      trainNo: json["trainNo"] as String,
      trainName: json["trainName"] as String,
      daysRun: json['daysRun'] as String,
      duration: json["duration"] ?? '',
      stationFrom: json["source"] as String,
      stationTo: json["destination"] as String,
      stations: data,
    );
  }
}
