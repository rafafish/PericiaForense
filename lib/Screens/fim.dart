import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/home.dart';
import 'package:pericia_iml/Services/prefs.dart';
import 'package:pericia_iml/Services/survey.dart';
import 'package:pericia_iml/services/globals.dart' as globals;

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  ServicesSurvey servicesSurvey = ServicesSurvey();
  Prefs prefs = Prefs();

  saveDataSurvey() {
    globals.singleSurvey.datahora_fim = DateTime.now().toString();
    globals.singleSurvey.regStatus = 'L';
  }

  addDataSurveyList() {
    globals.listSurvey.add(globals.singleSurvey.toMap());
  }

  void _sync() {
    servicesSurvey.insertLocalDB(globals.listSurvey);
    servicesSurvey.syncronizeData();
    prefs.getUpdated();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
                width: 200.0,
                height: 200.0,
                child: Center(child: CircularProgressIndicator())));
      },
    );
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context); //pop dialog

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('FIM'),
        ])),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Text('Muito Obrigado pelas informações',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 180.0,
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        'TERMINAR PESQUISA',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        saveDataSurvey();
                        addDataSurveyList();
                        _sync();
                      },
                    ))
              ],
            )));
  }
}
