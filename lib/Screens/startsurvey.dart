import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/tabform.dart';
import 'package:pericia_iml/Screens/tablesoes.dart';
import 'package:pericia_iml/services/globals.dart' as globals;

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  saveDataSurvey() {
    var uuid = Uuid();
    globals.singleSurvey.id = '';
    globals.singleSurvey.datahora_inicio = '';
    globals.singleSurvey.datahora_fim = '';
    globals.singleSurvey.sobre_novo_posicionamento = '';
    globals.singleSurvey.evento_de_lancamento = '';
    globals.singleSurvey.melhorar_suas_operacoes = '';
    globals.singleSurvey.regStatus = '';
    globals.listSurvey = [];
    globals.singleSurvey.id = uuid.v1();
    globals.singleSurvey.datahora_inicio = DateTime.now().toString();
  }

  int _currentIndex = 0;

  final tabs = [
    TabForm(),
    Center(child: Text('2')),
    Center(child: Text('3')),
    TabLesoes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Perícia IML'),
      ])),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
