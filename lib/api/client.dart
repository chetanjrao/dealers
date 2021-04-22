import 'dart:convert';
import 'dart:io';

import 'package:dealers/api/constants.dart';
import 'package:dealers/utils/prefs.dart';
import 'package:http/http.dart' as http;

class APIClient {
  LocalPreferences _preferences = LocalPreferences();

  Future<http.Response> processLogin(String mobile) async {
    return http.post("$apiUrl/rest/accounts/login/process/",
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({"mobile": mobile}));
  }

  Future<http.Response> verifyLogin(String mobile, String otp) async {
    return http.post("$apiUrl/rest/accounts/login/verify/",
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({"mobile": mobile, "otp": otp}));
  }

  Future<http.Response> getData(String code, String from, String to) async {
    String accessToken = await _preferences.getAccessToken();
    return http.post("$apiUrl/dealers/api/data/?from=$from&to=$to",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $accessToken"
        },
        body: jsonEncode({
          "code": code,
        }));
  }

  Future<http.Response> getProfile() async {
    String accessToken = await _preferences.getAccessToken();
    return http.get("$apiUrl/dealers/api/profile/", headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $accessToken"
    });
  }

  Future<http.Response> getCustomers(String code) async {
    String accessToken = await _preferences.getAccessToken();
    return http.post("$apiUrl/dealers/api/customers/",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $accessToken"
        },
        body: jsonEncode({
          "code": code,
        }));
  }

  Future<http.Response> getCustomerProfile(
      String code, dynamic customer) async {
    String accessToken = await _preferences.getAccessToken();
    return http.post("$apiUrl/dealers/api/customers/profile/",
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $accessToken"
        },
        body: jsonEncode({"code": code, "customer": customer}));
  }
}
