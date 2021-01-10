import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {

  Future<String> getAccessToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("access_token");
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("refresh_token");
  }

  Future<bool> setAccessToken(String accessToken) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString("access_token", accessToken);
  }

  Future<bool> setRefreshToken(String refreshToken) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString("refresh_token", refreshToken);
  }

}
