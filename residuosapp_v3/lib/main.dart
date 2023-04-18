import 'package:residuosapp_v3/pages/pageHistorial.dart';
import 'package:residuosapp_v3/pages/pageIndex.dart';
import 'package:residuosapp_v3/pages/pageVenta.dart';
//import 'package:residuosapp_v3/pages/pagesFlutter.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<MyApp> {
  int pageIndex = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final PageIndex _listIndex = PageIndex();
  final PageVenta _listVenta = PageVenta();
  final PageHistorial _listHistorial = PageHistorial();

  Widget _showPage = new PageIndex();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listVenta;
      //break;
      case 1:
        return _listIndex;
      //break;
      case 2:
        return _listHistorial;
      //break;
      default:
        return Container(
          child: const Center(
              child: Text(
            'No page found',
            style: TextStyle(fontSize: 30),
          )),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            //elimina padding del list view
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 206, 206, 206),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logo.png'))),
                child: Stack(
                  children: const <Widget>[
                    /*Positioned(
                        bottom: 5.0,
                        left: 20.0,
                        child: Text("1.0.0",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500))),*/
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: const Text('Acerca De'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app_outlined),
                title: const Text('Salir'),
                onTap: () {},
              ),
              const AboutListTile(
                icon: Icon(
                  Icons.info,
                ),
                child: Text('Acerca De'),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'Sagrado Agave App',
                applicationVersion: '1.0.0',
                applicationLegalese: '2023',
              )
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          //initialIndex: pageIndex,
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 60.0,

          items: const <Widget>[
            Icon(
              Icons.attach_money_rounded,
              size: 30,
              color: Color.fromARGB(255, 45, 135, 70),
            ),
            Icon(Icons.home, size: 30, color: Color.fromARGB(255, 45, 135, 70)),
            Icon(Icons.date_range_outlined,
                size: 30, color: Color.fromARGB(255, 45, 135, 70)),
          ],
          color: Colors.white,

          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 112, 167, 138),
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 800),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },

          letIndexChange: (index) => true,
        ),
        body: Container(
            color: Colors.blueAccent,
            child: Center(
              child: _showPage,
            )));
  }
}
