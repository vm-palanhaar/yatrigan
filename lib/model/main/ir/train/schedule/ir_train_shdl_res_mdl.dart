import 'package:yatrigan/model/error_mdl.dart';
import 'package:yatrigan/model/main/ir/train/schedule/ir_train_shdl_mdl.dart';

class IrTrainShdlResMdl {
  final String trainNo;
  final IrTrainShdlMdl? shdl;
  final ErrorMdl? error;

  IrTrainShdlResMdl({
    required this.trainNo,
    this.shdl,
    this.error,
  });

  factory IrTrainShdlResMdl.success(Map<String, dynamic> json) {
    return IrTrainShdlResMdl(
      trainNo: json["train"] as String,
      shdl: IrTrainShdlMdl.fromJson(json['schedule']),
    );
  }

  factory IrTrainShdlResMdl.fail(Map<String, dynamic> json) {
    return IrTrainShdlResMdl(
      trainNo: json["train"] as String,
      error: ErrorMdl.fromJson(json['error']),
    );
  }
}