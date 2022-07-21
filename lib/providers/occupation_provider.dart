import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsdd/models/occupation.dart';

import '../networks/api_service.dart';
import '../networks/network_client.dart';

class OccupationProvider with ChangeNotifier {
  ApiService apiService =
      ApiService(networkClient: NetworkClient('http://10.5.6.55:8000/'));
//  List<Occupation> occupation=[];
  List<DropdownMenuItem<Occupation>> _occupation = [];

  get occupation {
    return _occupation;
  }

  Future<void> getOccupationFromAPI() async {
    //get data from network
    final res = await apiService.getOccupationFromAPI();
    //convert res to key value (map)
    Map<String, dynamic> mp = jsonDecode(res.toString());
    print(mp.length);

    _occupation = (mp['data'] as List).map((e) {
      Occupation occupation = Occupation.fromJson(e);
      return DropdownMenuItem<Occupation>(
        value: occupation,
        child: Text(occupation.name),
      );
    }).toList();
    // print(_occupation.length);

    notifyListeners();
  }
}
