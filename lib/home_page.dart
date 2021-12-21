import 'package:flutter/material.dart';
import 'package:json_api_users/main.dart';
import 'package:json_api_users/mis_contactos2.dart';
// import 'package:json_api_users/usuarios.dart';

// import 'mis_contactos2.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGENDA TELEFONICA'),
        centerTitle: true,
      ),
      backgroundColor: Colors.orange.shade100,
      body: const MisContactos(),
    );
  }
}
