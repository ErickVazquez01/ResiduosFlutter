//import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:residuosapp_v3/pages/pageAdd.dart';

class PageIndex extends StatelessWidget {
  //const PagePlace({super.key});
  List<String> name = [
    'Cartón',
    'Botellas de Vidrio',
    'Botellas de Plastico',
    'Filtros',
    'Pegamento',
    'Cinta fleje'
  ];
  List<String> img = [
    'caja.png',
    'botellaVidrio.png',
    'botellaPlastico.png',
    'filtro.png',
    'pegamento.png',
    'cinta.png'
  ];
  List<String> tipo = [
    'Papel y cartón',
    'Plastico',
    'Vidrio',
    'Metal',
    'Organico',
    'Otros'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'asdasd',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
          appBar: AppBar(
              title: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  //abre drawer generado en main.dart
                  Scaffold.of(context).openDrawer();
                },
              ),
              const Text(
                'Usuario: John-117',
              ),
            ],
          )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 50,
                child: const Text(
                  'Residuos',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 45, 135, 70),
                  ),
                ),
              ),
              Expanded(
                //flex: 5,
                child: ListView.builder(
                  //listView.builder es para listas que no sabemos el tamaño (en demanda)
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 45, 135, 70),
                              width: 2)),
                      elevation: 5,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          //print('Card tapped.');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageAdd(
                                        name[index],
                                        tipo[index],
                                      )));
                        },
                        child: Row(
                          children: <Widget>[
                            const Spacer(),

                            Image.asset(
                              'assets/iconResiduos/' + img[index],
                              width: 64,
                            ), //la imagen está descargada en 64px
                            //Icon(Icons.terrain_sharp),
                            const Spacer(),
                            SizedBox(
                              height: 100,
                              child: Center(
                                  child: Text(
                                name[index],
                                style: const TextStyle(fontSize: 20),
                              )),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, top: 10),
                color: const Color.fromARGB(255, 112, 167, 138),
                height: 15,
              ),
            ],
          )),
    );
  }
}
