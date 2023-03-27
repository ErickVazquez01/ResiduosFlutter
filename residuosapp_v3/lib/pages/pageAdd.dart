import 'package:flutter/material.dart';

class PageAdd extends StatelessWidget {
  final String name;
  final String tipo;
  const PageAdd(this.name, this.tipo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(top: 0),
              //color: Color.fromARGB(255, 170, 37, 37),
              height: 50,
              child: InputChip(
                onPressed: () {},
                elevation: 5,
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: const Text(
                    'i',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                label: Text(
                  tipo,
                  style: const TextStyle(fontSize: 20),
                ),
              )),
          Expanded(
              child: Container(
            color: Color.fromARGB(255, 236, 140, 140),
          )),
          Center(
            child: Text(
              'Nombre: $name',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: Text(
              'Tipo: $tipo',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
