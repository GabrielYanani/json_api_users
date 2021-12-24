import 'package:flutter/material.dart';

import 'package:json_api_users/usuarios.dart';

class MisContactos extends StatelessWidget {
  final List<Datos> usuarios;
  const MisContactos(
    this.usuarios,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int i) {
          final usuario = usuarios[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white,
              title: Text('${usuario.name} ${usuario.company.name}'),
              subtitle:
                  Text('${usuario.address.street} ${usuario.address.suite}'),
              trailing: Text(usuario.email),
            ),
          );
        });
  }
}
