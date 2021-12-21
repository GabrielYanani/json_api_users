import 'package:flutter/material.dart';
import 'package:json_api_users/main.dart';
import 'package:json_api_users/mis_contactos2.dart';



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
            
                return MisContactos(snapshot.data);
              }
            return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }
}
