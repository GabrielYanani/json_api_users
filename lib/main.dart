import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_api_users/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

Future<List> getUsuarios() async {
  Client http = Client();
  Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Response respuesta = await http.get(uri);
  List miLista = jsonDecode(respuesta.body);
  return miLista;
}
