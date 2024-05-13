import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error in statusCode ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required String? token,
      @required dynamic body}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required String? token,
      @required dynamic body}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} ');
    }
  }
}
