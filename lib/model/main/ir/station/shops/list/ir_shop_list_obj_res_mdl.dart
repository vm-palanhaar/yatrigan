class IrShopListObjResMdl {
  final String id;
  final String shopName;
  final String shopNo;
  final String shopImg;
  final String plt1;
  final String plt2;
  final bool isOpen;

  IrShopListObjResMdl({
    required this.id,
    required this.shopName,
    required this.shopNo,
    required this.shopImg,
    required this.plt1,
    required this.plt2,
    required this.isOpen,
  });

  String getPlt() {
    if (plt1.isNotEmpty && plt2.isNotEmpty) {
      return '$plt1, $plt2';
    } else if (plt1.isNotEmpty && plt2.isEmpty) {
      return plt1;
    } else if (plt1.isEmpty && plt2.isNotEmpty) {
      return plt2;
    }
    return '';
  }

  factory IrShopListObjResMdl.fromJson(Map<String, dynamic> json) {
    return IrShopListObjResMdl(
      id: json["id"] as String,
      shopName: json["name"] as String,
      shopNo: json["shop_no"] as String,
      shopImg: json["img"] as String,
      plt1: json["plt1"] ?? '',
      plt2: json["plt2"] ?? '',
      isOpen: json["is_open"] as bool,
    );
  }
}