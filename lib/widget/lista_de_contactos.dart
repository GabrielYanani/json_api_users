import 'package:flutter/material.dart';
import 'package:json_api_users/paginas/detalle_de_contactos.dart';

import 'package:json_api_users/usuarios.dart';

class ListaDeContactos extends StatelessWidget {
  final List<User> usuarios;
  const ListaDeContactos(
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
            title: Text(usuario.name),
            subtitle: Text(usuario.phone),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleDeContactos(usuarios[i]),
                  ));
            },
          ),
        );
      },
    );
  }
}
