class IrTrainListResMdl {
  final int lenSt;
  final List<String> trains;

  IrTrainListResMdl({
    required this.lenSt,
    required this.trains,
  });

  factory IrTrainListResMdl.fromJson(Map<String, dynamic> json) {
    return IrTrainListResMdl(
      lenSt: json['total'] as int,
      trains: List<String>.from(json['trains'] as List),
    );
  }
}