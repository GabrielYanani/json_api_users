import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api_users/home_page.dart';
import 'package:json_api_users/usuarios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

Future<Datos> getUsuarios() async {
  final http.Response respuesta =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  Map <String, dynamic> data = convert.json.decode(respuesta.body) as Map <String, dynamic>;
  return Datos.fromJson(data); 
}