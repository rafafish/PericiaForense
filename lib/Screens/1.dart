import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/2.dart';
import 'package:pericia_iml/services/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _rating = '';

  saveDataSurvey() {
    globals.singleSurvey.sobre_novo_posicionamento = _rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '1/3',
            ),
          ]),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'O que você achou do novo posicionamento da Vendemmia?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 30,
                    ),
                    RatingBar(
                      initialRating: 0,
                      itemCount: 5,
                      itemSize: 60.0,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                        }
                      },
                      onRatingUpdate: (rating) {
                        String _textString = '';
                        int _intRating = 0;
                        print(rating);
                        _intRating = (rating).round();
                        switch (_intRating) {
                          case 1:
                            _textString = 'Péssimo';
                            break;
                          case 2:
                            _textString = 'Ruim';
                            break;
                          case 3:
                            _textString = 'Regular';
                            break;
                          case 4:
                            _textString = 'Bom';
                            break;
                          case 5:
                            _textString = 'Ótimo';
                            break;
                        }
                        setState(() {
                          _rating = _textString;
                        });
                      },
                    ),
                    Text(
                      "$_rating",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 180.0,
                        height: 60.0,
                        child: RaisedButton(
                          child: Text(
                            'PRÓXIMO',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              saveDataSurvey();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Screen2()));
                            }
                          },
                        ))
                  ],
                ))));
  }
}
