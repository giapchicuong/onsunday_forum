import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this.sf);
  final SharedPreferences sf;
  Future<void> saveToken(String token) async {
    await sf.setString(AuthDataConstants.tokenKey, token);
  }

  Future<String?> getToken() async {
    return sf.getString(AuthDataConstants.tokenKey);
  }
}
