class IrShopInfoObjResMdl {
  final String id;
  final String shopName;
  final String shopNo;
  final String shopImg;
  final String contactNo;
  final String plt1;
  final String plt2;
  final String shopLat;
  final String shopLon;
  final bool isCash;
  final bool isUpi;
  final bool isCard;

  IrShopInfoObjResMdl({
    required this.id,
    required this.shopName,
    required this.shopNo,
    required this.shopImg,
    required this.contactNo,
    required this.plt1,
    required this.plt2,
    required this.shopLat,
    required this.shopLon,
    required this.isCash,
    required this.isUpi,
    required this.isCard,
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

  factory IrShopInfoObjResMdl.fromJson(Map<String, dynamic> json) {
    return IrShopInfoObjResMdl(
      id: json["id"] as String,
      shopName: json["name"] as String,
      shopNo: json["shop_no"] as String,
      shopImg: json["img"] as String,
      contactNo: json["contact_no"] as String,
      plt1: json["plt1"] ?? '',
      plt2: json["plt2"] ?? '',
      shopLat: json["lat"] as String,
      shopLon: json["lon"] as String,
      isCash: json["is_cash"] as bool,
      isUpi: json["is_upi"] as bool,
      isCard: json["is_card"] as bool,
    );
  }
}
