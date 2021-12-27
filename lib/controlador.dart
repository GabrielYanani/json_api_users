import 'package:http/http.dart';
import 'package:json_api_users/usuarios.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<User>> getUsuarios() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Client http = Client();
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Response respuesta = await http.get(uri);
  prefs.setString('user', respuesta.body);
  final List<User> user = datosFromJson(respuesta.body);
  return user;
}
