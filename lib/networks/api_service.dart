import 'package:dio/dio.dart';

import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({required this.networkClient});

  Future<Response> getCountriesFromAPI() {
    return networkClient.get('api/countries');
  }

  Future<Response> getOccupationFromAPI() {
    return networkClient.get('api/occupations');
  }

  // getOccupationFromAPI() {}

  // Future<Response> getPrayerTiming(
  //     int timeStamp, Map<String, Object> params) async {
  //   return await networkClient.get('/$timeStamp', params);
  // }

}
