import 'package:flutter/material.dart';
import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/services.dart';

class PageHistorial extends StatelessWidget {
  //const PagePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'asdasd',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Color.fromARGB(255, 112, 167, 138)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Historial'),
        ),
        body: Container(
            child: ColumnScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 0, 0, 0),
                height: 120,
              ),
              Container(
                color: Color.fromARGB(255, 216, 176, 176),
                height: 120,
              ),
              Container(
                color: Color.fromARGB(255, 151, 14, 14),
                height: 120,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
