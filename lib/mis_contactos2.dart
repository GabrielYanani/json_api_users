import 'package:flutter/material.dart';
import 'package:json_api_users/main.dart';

class MisContactos extends StatelessWidget {
  const MisContactos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsuarios(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List usuarios = snapshot.data;
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (BuildContext context, int i) {
              final usuario = usuarios[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  title:
                      Text('${usuario['name']} ${usuario['company']['name']}'),
                  subtitle: Text(
                      '${usuario['address']['street']} ${usuario['address']['suite']}'),
                  trailing: Text(usuario['email']),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
