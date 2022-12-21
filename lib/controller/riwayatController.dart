import 'dart:convert';

import 'package:hadir_bu/models/Riwayat.dart';
import 'package:hadir_bu/widgets/riwayat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RiwayatAPI {
  Future<List<RiwayatModel>> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('user');
    final url = 'http://raufendro-dev.com:1998/riwayatabsen/username=$username';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final riwayat = json.map((e) {
        return RiwayatModel(
            id: e['id'],
            username: e['username'],
            lokasi: e['lokasi'],
            tanggal: e['tanggal'],
            status: e['status']);
      }).toList();
      return riwayat;
    }
    return [];
    //throw "Ada yang gak bener";
  }
}
