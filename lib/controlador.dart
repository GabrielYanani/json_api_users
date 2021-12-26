import 'package:http/http.dart';
import 'package:json_api_users/usuarios.dart';

Future <List<User>> getUsuarios() async {
  Client http = Client();
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Response respuesta = await http.get(uri);
  final List <User> user = datosFromJson(respuesta.body);
  return user;
}