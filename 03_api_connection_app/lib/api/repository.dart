
import 'dart:convert';

import 'package:api_connection_app/api/interfaces/network_service.dart';
import 'package:api_connection_app/models/content.dart';
import 'package:chopper/chopper.dart';

class Repository {
  final NetworkService service;

  Repository(ChopperClient client) : service = NetworkService.create(client);

  Future<List<Content>> fetchContents() async {
    final Response response = await service.getContents();
    if (response.isSuccessful) {
      var decoded = jsonDecode(response.body);
      print(decoded);
      return ContentList.fromJson(decoded).values;
    } else {
      return [];
    }
  }
}