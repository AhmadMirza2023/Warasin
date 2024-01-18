import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:warasin/models/konselor_model.dart';
import 'package:warasin/services/konselor_service.dart';

class KonselorProvider with ChangeNotifier {
  late List<KonselorModel> _konselors = [];

  List<KonselorModel> get konselors => _konselors;

  set konselors(List<KonselorModel> konselors) {
    _konselors = konselors;
    notifyListeners();
  }

  Future<void> getKonselors() async {
    try {
      List<KonselorModel> konselors = await KonselorService().getKonselors();
      _konselors = konselors;
      print('Konselors length: ${_konselors.length}');
      print(
          'List of Konselor IDs: ${_konselors.map((konselor) => konselor.id)}');
    } catch (e) {
      print(e);
    }
  }

  KonselorModel? getKonselorById(int konselorId) {
    print('Searching for Konselor with ID: $konselorId');
    return _konselors.isNotEmpty
        ? _konselors.firstWhereOrNull((konselor) => konselor.id == konselorId)
        : null;
  }
}
