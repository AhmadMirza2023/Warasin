import 'package:flutter/material.dart';
import 'package:warasin/models/user_model.dart';
import 'package:warasin/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // bool get isAuthenticated => _user != null;

  Future<bool> register({
    String? email,
    String? nama,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        nama: nama,
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> login({
    String? email,
    String? nama,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void logout() {
    print('User ${_user.nama} logged out at ${DateTime.now()}');
    // _user = UserModel(nama: '', email: '', foto: '', id: 0, tanggalLahir: '');
    notifyListeners();
  }
}
