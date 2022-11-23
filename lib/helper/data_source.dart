import 'base_network.dart';

class StarDataSource {
  static StarDataSource instance = StarDataSource();
  Future<Map<String, dynamic>> loadCharcters() {
    return BaseNetwork.get("people");
  }
}
