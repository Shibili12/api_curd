import 'dart:convert';

import 'package:http/http.dart' as http;

String baseurl = "https://652cd09dd0d1df5273efb554.mockapi.io/users";

class Baseclient {
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseurl + api);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var uri = Uri.parse(baseurl + api);
    var _payload = jsonEncode(object);
    var _headers = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(uri, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var uri = Uri.parse(baseurl + api);
    var _payload = jsonEncode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.put(uri, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> delete(String api) async {
    var uri = Uri.parse(baseurl + api);
    var response = await client.delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
