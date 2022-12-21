import 'package:flutter/material.dart';
import 'package:hadir_bu/controller/riwayatController.dart';
import 'package:hadir_bu/models/Riwayat.dart';

class RiwayatProvider extends ChangeNotifier {
  final _api = RiwayatAPI();
  bool isLoading = false;
  List<RiwayatModel> _riwayat = [];
  List<RiwayatModel> get riwayat => _riwayat;

  Future<void> getAllRiwayat() async {
    isLoading = true;
    notifyListeners();
    final response = await _api.getAll();
    _riwayat = response;
    isLoading = false;
    notifyListeners();
  }
}
