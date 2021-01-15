import 'package:flutter/material.dart';

class TabLesoes extends StatefulWidget {
  @override
  _TabLesoesState createState() => _TabLesoesState();
}

class _TabLesoesState extends State<TabLesoes> with TickerProviderStateMixin {
  TabController _nestedTabController;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final lesao23 = TextEditingController();
  String valueLesao23 = '';
  final lesao12 = TextEditingController();
  String valueLesao12 = '';
  final lesao45 = TextEditingController();
  String valueLesao45 = '';
  final lesao33 = TextEditingController();
  String valueLesao33 = '';
  final lesao47 = TextEditingController();
  String valueLesao47 = '';

  final lesao55 = TextEditingController();
  String valueLesao55 = '';
  final lesao56 = TextEditingController();
  String valueLesao56 = '';
  final lesao57 = TextEditingController();
  String valueLesao57 = '';
  final lesao58 = TextEditingController();
  String valueLesao58 = '';
  final lesao59 = TextEditingController();
  String valueLesao59 = '';
  final lesao60 = TextEditingController();
  String valueLesao60 = '';

  final lesao65 = TextEditingController();
  String valueLesao65 = '';
  final lesao66 = TextEditingController();
  String valueLesao66 = '';
  final lesao67 = TextEditingController();
  String valueLesao67 = '';
  final lesao68 = TextEditingController();
  String valueLesao68 = '';
  final lesao69 = TextEditingController();
  String valueLesao69 = '';
  final lesao70 = TextEditingController();
  String valueLesao70 = '';

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  Color setColorLesao23(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao12(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao45(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao33(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao47(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao55(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao56(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao57(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao58(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao59(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao60(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao65(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao66(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao67(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao68(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao69(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  Color setColorLesao70(lesao) {
    if (lesao != '') {
      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Frente",
            ),
            Tab(
              text: "Lateral Direita",
            ),
            Tab(
              text: "Lateral Esquerda",
            ),
            Tab(
              text: "Costas",
            ),
            Tab(
              text: "Face",
            ),
          ],
        ),
        Center(
            child: Container(
          height: screenHeight * 0.76,
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: 800,
          alignment: Alignment.center,
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              SingleChildScrollView(
                  child: Container(
                      child: Stack(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Image.asset('images/body.png'),
                          Positioned(
                            left: 20.0,
                            top: 80.0,
                            child: MaterialButton(
                              height: 3,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('LESÃO 23'),
                                        content: TextField(
                                          controller: lesao23,
                                          decoration: InputDecoration(
                                              hintText: "DESCRIÇÃO DA LESÃO"),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            child: Text('LIMPAR'),
                                            onPressed: () {
                                              setState(() {
                                                lesao23.clear();
                                                valueLesao23 = lesao23.text;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                          FlatButton(
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Text('OK'),
                                            onPressed: () {
                                              setState(() {
                                                valueLesao23 = lesao23.text;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              color: setColorLesao23(valueLesao23),
                              textColor: Colors.black,
                              child: Text(
                                "23",
                                style: TextStyle(fontSize: 8.0),
                              ),
                              padding: EdgeInsets.all(8),
                              shape: CircleBorder(),
                            ),
                          ),
                          Positioned(
                              left: 90.0,
                              top: 120.0,
                              child: MaterialButton(
                                height: 3,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('LESÃO 12'),
                                          content: TextField(
                                            controller: lesao12,
                                            decoration: InputDecoration(
                                                hintText: "DESCRIÇÃO DA LESÃO"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              color: Colors.red,
                                              textColor: Colors.white,
                                              child: Text('LIMPAR'),
                                              onPressed: () {
                                                setState(() {
                                                  lesao12.clear();
                                                  valueLesao12 = lesao12.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  valueLesao12 = lesao12.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                color: setColorLesao12(valueLesao12),
                                textColor: Colors.black,
                                child: Text(
                                  "12",
                                  style: TextStyle(fontSize: 8.0),
                                ),
                                padding: EdgeInsets.all(8),
                                shape: CircleBorder(),
                              )),
                          Positioned(
                              left: -28.0,
                              top: 200.0,
                              child: MaterialButton(
                                height: 3,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('LESÃO 45'),
                                          content: TextField(
                                            controller: lesao45,
                                            decoration: InputDecoration(
                                                hintText: "DESCRIÇÃO DA LESÃO"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              color: Colors.red,
                                              textColor: Colors.white,
                                              child: Text('LIMPAR'),
                                              onPressed: () {
                                                setState(() {
                                                  lesao45.clear();
                                                  valueLesao45 = lesao45.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  valueLesao45 = lesao45.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                color: setColorLesao45(valueLesao45),
                                textColor: Colors.black,
                                child: Text(
                                  "45",
                                  style: TextStyle(fontSize: 8.0),
                                ),
                                padding: EdgeInsets.all(8),
                                shape: CircleBorder(),
                              )),
                          Positioned(
                              left: 50.0,
                              top: 200.0,
                              child: MaterialButton(
                                height: 3,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('LESÃO 33'),
                                          content: TextField(
                                            controller: lesao33,
                                            decoration: InputDecoration(
                                                hintText: "DESCRIÇÃO DA LESÃO"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              color: Colors.red,
                                              textColor: Colors.white,
                                              child: Text('LIMPAR'),
                                              onPressed: () {
                                                setState(() {
                                                  lesao33.clear();
                                                  valueLesao33 = lesao33.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  valueLesao33 = lesao33.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                color: setColorLesao33(valueLesao33),
                                textColor: Colors.black,
                                child: Text(
                                  "33",
                                  style: TextStyle(fontSize: 8.0),
                                ),
                                padding: EdgeInsets.all(8),
                                shape: CircleBorder(),
                              )),
                          Positioned(
                              left: 73.0,
                              top: 350.0,
                              child: MaterialButton(
                                height: 3,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('LESÃO 47'),
                                          content: TextField(
                                            controller: lesao47,
                                            decoration: InputDecoration(
                                                hintText: "DESCRIÇÃO DA LESÃO"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              color: Colors.red,
                                              textColor: Colors.white,
                                              child: Text('LIMPAR'),
                                              onPressed: () {
                                                setState(() {
                                                  lesao47.clear();
                                                  valueLesao47 = lesao47.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text('OK'),
                                              onPressed: () {
                                                setState(() {
                                                  valueLesao47 = lesao47.text;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                color: setColorLesao47(valueLesao47),
                                textColor: Colors.black,
                                child: Text(
                                  "47",
                                  style: TextStyle(fontSize: 8.0),
                                ),
                                padding: EdgeInsets.all(8),
                                shape: CircleBorder(),
                              )),
                        ],
                      )),
                  Positioned(
                      left: 180.0,
                      top: 100.0,
                      child: Text(
                        valueLesao23,
                        style: TextStyle(fontSize: 10.0),
                      )),
                  Positioned(
                      right: 170.0,
                      top: 140.0,
                      child: Text(
                        valueLesao12,
                        style: TextStyle(fontSize: 10.0),
                      )),
                  Positioned(
                      left: 180.0,
                      top: 215.0,
                      child: Text(
                        valueLesao45,
                        style: TextStyle(fontSize: 10.0),
                      )),
                  Positioned(
                      right: 190.0,
                      top: 220.0,
                      child: Text(
                        valueLesao33,
                        style: TextStyle(fontSize: 10.0),
                      )),
                  Positioned(
                      right: 220.0,
                      top: 365.0,
                      child: Text(
                        valueLesao47,
                        style: TextStyle(fontSize: 10.0),
                      )),
                ],
              ))),
              Container(
                child: Text('Lateral Esquerda'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Lateral Direita'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Costas'),
              ),
              SingleChildScrollView(
                  child: Container(
                      child: Stack(children: [
                Container(
                    alignment: Alignment.center,
                    child: Stack(children: [
                      Column(
                        children: [
                          Image.asset('images/facefrente.png'),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset('images/facelado.png'),
                        ],
                      ),
                      Positioned(
                          left: 30.0,
                          top: 80.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 65'),
                                      content: TextField(
                                        controller: lesao65,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao65.clear();
                                              valueLesao65 = lesao65.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao65 = lesao65.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao65(valueLesao65),
                            textColor: Colors.black,
                            child: Text(
                              "65",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 180.0,
                          top: 30.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 66'),
                                      content: TextField(
                                        controller: lesao66,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao66.clear();
                                              valueLesao66 = lesao66.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao66 = lesao66.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao66(valueLesao66),
                            textColor: Colors.black,
                            child: Text(
                              "66",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 190.0,
                          top: 180.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 67'),
                                      content: TextField(
                                        controller: lesao67,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao67.clear();
                                              valueLesao67 = lesao67.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao67 = lesao67.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao67(valueLesao67),
                            textColor: Colors.black,
                            child: Text(
                              "67",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 30.0,
                          top: 250.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 68'),
                                      content: TextField(
                                        controller: lesao68,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao68.clear();
                                              valueLesao68 = lesao68.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao68 = lesao68.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao68(valueLesao68),
                            textColor: Colors.black,
                            child: Text(
                              "68",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 120.0,
                          top: 330.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 70'),
                                      content: TextField(
                                        controller: lesao70,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao70.clear();
                                              valueLesao70 = lesao70.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao70 = lesao70.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao70(valueLesao70),
                            textColor: Colors.black,
                            child: Text(
                              "70",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 100.0,
                          top: 430.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 55'),
                                      content: TextField(
                                        controller: lesao55,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao55.clear();
                                              valueLesao55 = lesao55.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao55 = lesao55.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao65(valueLesao55),
                            textColor: Colors.black,
                            child: Text(
                              "55",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 10.0,
                          top: 550.0,
                          child: MaterialButton(
                            height: 2,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 56'),
                                      content: TextField(
                                        controller: lesao56,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao56.clear();
                                              valueLesao56 = lesao56.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao56 = lesao56.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao56(valueLesao56),
                            textColor: Colors.black,
                            child: Text(
                              "56",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 250.0,
                          top: 580.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 57'),
                                      content: TextField(
                                        controller: lesao57,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao57.clear();
                                              valueLesao57 = lesao57.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao57 = lesao57.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao57(valueLesao57),
                            textColor: Colors.black,
                            child: Text(
                              "57",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 235.0,
                          top: 650.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 58'),
                                      content: TextField(
                                        controller: lesao58,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao58.clear();
                                              valueLesao58 = lesao58.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao58 = lesao58.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao58(valueLesao58),
                            textColor: Colors.black,
                            child: Text(
                              "58",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 50.0,
                          top: 700.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 59'),
                                      content: TextField(
                                        controller: lesao59,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao59.clear();
                                              valueLesao59 = lesao59.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao59 = lesao59.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao59(valueLesao59),
                            textColor: Colors.black,
                            child: Text(
                              "59",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                      Positioned(
                          left: 150.0,
                          top: 750.0,
                          child: MaterialButton(
                            height: 3,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('LESÃO 60'),
                                      content: TextField(
                                        controller: lesao60,
                                        decoration: InputDecoration(
                                            hintText: "DESCRIÇÃO DA LESÃO"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('LIMPAR'),
                                          onPressed: () {
                                            setState(() {
                                              lesao60.clear();
                                              valueLesao60 = lesao60.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            setState(() {
                                              valueLesao60 = lesao60.text;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: setColorLesao60(valueLesao60),
                            textColor: Colors.black,
                            child: Text(
                              "60",
                              style: TextStyle(fontSize: 8.0),
                            ),
                            padding: EdgeInsets.all(8),
                            shape: CircleBorder(),
                          )),
                    ])),
                Positioned(
                    left: 120.0,
                    top: 100.0,
                    child: Text(
                      valueLesao65,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 160.0,
                    top: 50.0,
                    child: Text(
                      valueLesao66,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 110.0,
                    top: 200.0,
                    child: Text(
                      valueLesao67,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    left: 120.0,
                    top: 270.0,
                    child: Text(
                      valueLesao68,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 170.0,
                    top: 350.0,
                    child: Text(
                      valueLesao70,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    left: 120.0,
                    top: 450.0,
                    child: Text(
                      valueLesao55,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    left: 90.0,
                    top: 570.0,
                    child: Text(
                      valueLesao56,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 80.0,
                    top: 600.0,
                    child: Text(
                      valueLesao57,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 100.0,
                    top: 670.0,
                    child: Text(
                      valueLesao58,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    left: 110.0,
                    top: 720.0,
                    child: Text(
                      valueLesao59,
                      style: TextStyle(fontSize: 10.0),
                    )),
                Positioned(
                    right: 180.0,
                    top: 770.0,
                    child: Text(
                      valueLesao60,
                      style: TextStyle(fontSize: 10.0),
                    )),
              ]))),
            ],
          ),
        ))
      ],
    ));
  }
}
