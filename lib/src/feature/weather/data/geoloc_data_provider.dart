import 'package:test_app/src/core/configuration/configuration.dart';
import 'package:test_app/src/feature/common/data/network/network_client.dart';

import '../model/location.dart';

abstract class IGeolocationDataProvider {
  // find location by name
  Future<Location> searchLocation({required String queryLocation});
}

class GeolocationDataProviderImpl implements IGeolocationDataProvider {
  final NetworkClient _client;
  const GeolocationDataProviderImpl({required final client}) : _client = client;

  @override
  Future<Location> searchLocation({required String queryLocation}) async {
    Location parser(dynamic json) {
      Map<String, dynamic> jsonMap;
      if (json is List && json.isNotEmpty) {
        jsonMap = json.first as Map<String, dynamic>;
      } else {
        jsonMap = json as Map<String, dynamic>;
      }
      final response = Location.fromJson(jsonMap);
      return response;
    }

    final response = _client.get(
        Configuration.geoPath, parser, <String, dynamic>{
      "q": queryLocation,
      "appid": Configuration.apiKey,
      "limit": "1"
    });
    return response;
  }
}
