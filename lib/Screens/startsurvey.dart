import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/tabform.dart';
import 'package:pericia_iml/Screens/tablesoes.dart';
import 'package:pericia_iml/Screens/tabcroqui.dart';
import 'package:pericia_iml/Screens/tabfotos.dart';
import 'package:pericia_iml/services/globals.dart' as globals;

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  iniciaPericia() {
    var uuid = Uuid();
    globals.listPericia = [];
    globals.singlePericia.id = uuid.v1();
    globals.singlePericia.datahora_inicio = DateTime.now().toString();
  }

  int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(TabForm());
    pageList.add(TabCroqui());
    pageList.add(TabFotos());
    pageList.add(TabLesoes());
    iniciaPericia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Perícia IML'),
      ])),
      body: IndexedStack(
        index: _selectedPage,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _onItemTapped,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: ('Dados da Ocorrência'),
              backgroundColor: Colors.grey[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: ('Croqui'),
              backgroundColor: Colors.grey[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: ('Fotos'),
              backgroundColor: Colors.grey[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility),
              label: ('Esquema de Lesões'),
              backgroundColor: Colors.grey[900]),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
