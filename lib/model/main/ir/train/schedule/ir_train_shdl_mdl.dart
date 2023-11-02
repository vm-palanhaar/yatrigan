import 'package:yatrigan/model/main/ir/train/schedule/ir_train_shdl_station_list_mdl.dart';

class IrTrainShdlMdl {
  final int trainNo;
  final String trainName;
  final String runStatus;
  final String duration;
  final String stationFrom;
  final String stationTo;
  List<IrTrainShdlStationListMdl> stations;

  IrTrainShdlMdl({
    required this.trainNo,
    required this.trainName,
    required this.runStatus,
    required this.duration,
    required this.stationFrom,
    required this.stationTo,
    required this.stations,
  });

  factory IrTrainShdlMdl.fromJson(Map<String, dynamic> json) {
    var responseData = json['stations'] as List;
    List<IrTrainShdlStationListMdl> data = responseData
        .map<IrTrainShdlStationListMdl>(
          (json) => IrTrainShdlStationListMdl.fromJson(json),
        )
        .toList();
    var runData = json['run_status'] as List;
    String listRunDays =
        runData.toString().replaceAll("[", "").replaceAll("]", "");
    return IrTrainShdlMdl(
      trainNo: json["train_no"] as int,
      trainName: json["train_name"] as String,
      runStatus: listRunDays,
      duration: json["duration"] ?? '',
      stationFrom: json["station_from"] as String,
      stationTo: json["station_to"] as String,
      stations: data,
    );
  }
}
