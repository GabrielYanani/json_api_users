import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_api_users/usuarios.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<User> _usuarios = [];
  List<User> get usuarios => _usuarios;

  Future<void> getUsuarios() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      Response respuesta = await http.get(uri);
      prefs.setString('user', respuesta.body);
      datosJson = respuesta.body;
    } catch (e) {
      datosJson = prefs.getString('user');
    }
    final List<User> user = datosFromJson(datosJson!);
    
    _usuarios.clear();
    _usuarios.addAll(user);
     notifyListeners();
  }
}
