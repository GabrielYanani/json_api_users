import 'package:flutter/material.dart';
import 'package:json_api_users/controlador.dart';
import 'package:json_api_users/paginas/detalle_de_contactos.dart';
import 'package:json_api_users/usuarios.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsuarioProvider>().getUserData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
          // Consumer de TIPO UsuarioProvider
          child: Consumer<UsuarioProvider>(
            builder: (BuildContext context, data, _) {
              // if (data.estaCargandoDatos == true) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }

              if (data.usuarios.isEmpty) {
                return const Center(
                  child: Text('Lista vacia'),
                );
              }

              return ListView(
                children: crearListadoDeUsuarios(data.usuarios, context),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> crearListadoDeUsuarios(List<User> usuarios, context) {
    return usuarios.map((User usuario) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalleDeContactos(usuario),
                ));
          },
          tileColor: Colors.orange,
          title: Text(usuario.name),
        
        ),
      );
    }).toList();
  }
}
