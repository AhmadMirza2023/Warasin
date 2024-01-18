import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warasin/models/konselor_model.dart';

class KonselorService {
  final String baseUrl = 'http://localhost:8080';

  Future<List<KonselorModel>> getKonselors() async {
    var url = '$baseUrl/psikolog';
    var header = {'Content-Type': 'application/json'};

    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['Data'];
      List<KonselorModel> konselors = [];

      for (var item in data) {
        konselors.add(KonselorModel.fromJson(item));
      }
      return konselors;
    } else {
      throw Exception('Failed Get Konselor');
    }
  }
}
