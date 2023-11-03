class IrTrainListMdl {
  final int lenSt;
  final List<String> trains;

  IrTrainListMdl({
    required this.lenSt,
    required this.trains,
  });

  factory IrTrainListMdl.fromJson(Map<String, dynamic> json) {
    return IrTrainListMdl(
      lenSt: json['total'] as int,
      trains: List<String>.from(json['trains'] as List),
    );
  }
}