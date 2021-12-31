import 'package:flutter/material.dart';
import 'package:json_api_users/usuarios.dart';

class DetalleDeContactos extends StatelessWidget {
  final User usuario;
  const DetalleDeContactos(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Id: ${usuario.id}',
                textScaleFactor: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    color: Colors.grey,
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Nombre: ${usuario.name}',
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'Compania: ${usuario.company.name}',
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          'Email: ${usuario.email}',
                          textScaleFactor: 1.5,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
