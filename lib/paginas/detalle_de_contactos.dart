import 'package:flutter/material.dart';
import 'package:json_api_users/usuarios.dart';

class DetalleDeContactos extends StatelessWidget {
  final User usuario;
  const DetalleDeContactos(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Id: ${usuario.id}'),
            Text('Nombre: ${usuario.name}'),
            Text('Compania: ${usuario.company.name}'),
            Text('Email: ${usuario.email}'),
          ],
        ),
      ),
    );
  }
}
