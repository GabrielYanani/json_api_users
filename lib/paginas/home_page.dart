import 'package:flutter/material.dart';
import 'package:json_api_users/controlador.dart';
import 'package:json_api_users/widget/lista_de_contactos.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsuarioProvider>().getUsuarios(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<UsuarioProvider>().getUsuarios(),
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Center(child: Text('Mis contactos')),
        ),
        body: SafeArea(
          child: Consumer<UsuarioProvider>(
            builder: (BuildContext context, data, _) {
              if (data.usuarios.isEmpty) {
                return const Center(
                  child: Text('Lista vacia'),
                );
              }
              return ListaDeContactos(data.usuarios);
            },
          ),
        ),
      ),
    );
  }
}
