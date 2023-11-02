class IrTrainListResMdl {
  final int lenSt;
  final List<String> train;

  IrTrainListResMdl({
    required this.lenSt,
    required this.train,
  });

  factory IrTrainListResMdl.fromJson(Map<String, dynamic> json) {
    return IrTrainListResMdl(
      lenSt: json['total'] as int,
      train: List<String>.from(json['trains'] as List),
    );
  }
}