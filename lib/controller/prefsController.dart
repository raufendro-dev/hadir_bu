import 'package:hadir_bu/models/Prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class prefsController {
  static set(username, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', username);
    prefs.setString('password', password);
  }

  static get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('user');
    final password = prefs.getString('password');
    final hasil = PrefsModel(username: username, password: password);
    return hasil;
  }
}
