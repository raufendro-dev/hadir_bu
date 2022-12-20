import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/User.dart';

import 'package:shared_preferences/shared_preferences.dart';

class API {
  static login(username, password) async {
    final uri = Uri.parse(
        'http://raufendro-dev.com:1998/username=$username&password=$password');
    var response = await http.get(uri);
    var responsedata = json.decode(response.body);
    if (responsedata.isNotEmpty) {
      if (responsedata[0]['username'] == username &&
          responsedata[0]['password'] == password) {
        var hasil = Usersimpan(
            id: responsedata[0]['id'],
            username: responsedata[0]['username'],
            password: responsedata[0]['password'],
            fullname: responsedata[0]['fullname'],
            gambar: responsedata[0]['gambar'].toString().replaceAll('\/', '/'));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', hasil.username);
        prefs.setString('password', hasil.password);
        return hasil;
      }
    } else {
      return 'dilarang';
    }
  }
}
