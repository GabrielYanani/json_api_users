import 'package:flutter/material.dart';
import 'package:json_api_users/main.dart';
import 'package:json_api_users/usuarios.dart';

import 'mis_contactos2.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AGENDA TELEFONICA'),
        ),
        body: FutureBuilder(
          future: getUsuarios(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List usuarios = snapshot.data as List;
              List<Widget> widgetUsuarios = usuarios.map((usuario) {
                return ListView.builder(
                    itemCount: usuarios.length,
                    itemBuilder: (BuildContext context, int i) {
                      final usuario = usuarios[i];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.white,
                          title:
                              Text('${usuario.name} ${usuario.company.name}'),
                          subtitle: Text(usuario.address.street),
                          trailing: Text(usuario.email),
                        ),
                      );
                    });
              }).toList();

              return ListView(
                children: widgetUsuarios,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
