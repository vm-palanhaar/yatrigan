const String baseUrlApi = 'http://192.168.29.176:8000/api';

//---Users---
enum UserApiUri {
  //PROD
  signup(uri: '$baseUrlApi/user/v1/signup'),
  login(uri: '$baseUrlApi/user/v1/login'),
  validate(uri: '$baseUrlApi/user/v1/validate'),
  profile(uri: '$baseUrlApi/user/v1/profile'),
  logout(uri: '$baseUrlApi/user/v1/logout'),
  //DEV
  doNotUse(uri: '');

  const UserApiUri({
    required this.uri,
  });

  final String uri;
}

//---IndianRailwaysApp---
const String baseUrlApiIrV1 = '$baseUrlApi/ir/v1';
const String baseUrlApiIrAppV1 = '$baseUrlApi/yatrigan/ir/v1';

enum IrApiUri {
  //PROD
  stations(uri: '$baseUrlApiIrV1/stations'),
  trains(uri: '$baseUrlApiIrV1/trainList'),
  stationShopList(uri: '$baseUrlApiIrAppV1/station/<code>/stalls'),
  stationShopInfo(
      uri: '$baseUrlApiIrAppV1/station/<code>/stalls/<id>/info'),
  //DEV
  doNotUse(uri: '');

  const IrApiUri({
    required this.uri,
  });

  final String uri;
}
