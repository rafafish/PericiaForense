import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/startsurvey.dart';
import 'package:pericia_iml/Services/prefs.dart';
import 'package:pericia_iml/Services/survey.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pericia_iml/services/globals.dart' as globals;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServicesSurvey servicesSurvey = ServicesSurvey();
  Prefs prefs = Prefs();
  String countTotal = '0';
  String countNotSync = '0';
  String currentAddress;
  Position currentLocation;
  String data;
  String hora;

  Future<bool> loadDataAsync() async {
    countTotal = await servicesSurvey.countCollected();
    countNotSync = await servicesSurvey.countNotSyncronized();
    await getUserLocation();
    await getAddressFromLatLng();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    data = formatter.format(now);
    final DateFormat timeformat = DateFormat('H:m');
    hora = timeformat.format(now);

    return true;
  }

  limpaLista() {
    globals.singlePericia.id = '';
    globals.singlePericia.datahora_inicio = '';
    globals.singlePericia.datahora_fim = '';
    globals.singlePericia.latitude = currentLocation.latitude.toString();
    globals.singlePericia.longitude = currentLocation.longitude.toString();
    globals.singlePericia.descricaoendereco = '';
    globals.singlePericia.isolado = '';
    globals.singlePericia.guarnecido = '';
    globals.singlePericia.preservado = '';
    globals.singlePericia.statuslocal = '';
    globals.singlePericia.equipeisolamento = '';
    globals.singlePericia.preservacaolocal = '';
    globals.singlePericia.policialmilitar0 = '';
    globals.singlePericia.policialmilitar1 = '';
    globals.singlePericia.policialcivil0 = '';
    globals.singlePericia.policialcivil1 = '';
    globals.singlePericia.outrasforcas0 = '';
    globals.singlePericia.outrasforcas1 = '';
    globals.singlePericia.tipoid0 = '';
    globals.singlePericia.tipoid1 = '';
    globals.singlePericia.numeroid0 = '';
    globals.singlePericia.numeroid1 = '';
    globals.singlePericia.relator0 = '';
    globals.singlePericia.relator1 = '';
    globals.singlePericia.tipoexame = '';
    globals.singlePericia.tipolocal = '';
    globals.singlePericia.nomecadaver = '';
    globals.singlePericia.tipodocumentocadaver = '';
    globals.singlePericia.numerodocumentocadaver = '';
    globals.singlePericia.idadecadaver = '';
    globals.singlePericia.sexocadaver = '';
    globals.singlePericia.ocupacao = '';
    globals.singlePericia.racacadaver = '';
    globals.singlePericia.compleicaocadaver = '';
    globals.singlePericia.cabeloscadaver = '';
    globals.singlePericia.cordoscabeloscadaver = '';
    globals.singlePericia.comprimentodoscabeloscadaver = '';
    globals.singlePericia.pelosfaciaiscadaver = '';
    globals.singlePericia.tipotatuagemcadaver = '';
    globals.singlePericia.localizacaotatuagemcadaver = '';
    globals.singlePericia.descricaocicatrizcadaver = '';
    globals.singlePericia.localizacaocicatrizcadaver = '';
    globals.singlePericia.tipopiercingcadaver = '';
    globals.singlePericia.localizacaopiercingcadaver = '';
    globals.singlePericia.outrotipodemarcapessoal = '';
    globals.singlePericia.vestescadaver = '';
    globals.singlePericia.roupasintimascadaver = '';
    globals.singlePericia.aderecosadornoscadaver = '';
    globals.singlePericia.sapatoscadaver = '';
    globals.singlePericia.posicionamentodocadaver = '';
    globals.singlePericia.posicaomembrosuperiordireito = '';
    globals.singlePericia.posicaomembrosuperioresquerdo = '';
    globals.singlePericia.posicaomembroinferiordireito = '';
    globals.singlePericia.posicaomembroinferioresquerdo = '';
    globals.singlePericia.rigidezcadaverica = '';
    globals.singlePericia.livoresdehipostase = '';
    globals.singlePericia.situacaodocadaver = '';
    globals.singlePericia.tipoarmadefogo = '';
    globals.singlePericia.marcaarmadefogo = '';
    globals.singlePericia.numerodeseriearmadefogo = '';
    globals.singlePericia.calibrearmadefogo = '';
    globals.singlePericia.carregadaarmadefogo = '';
    globals.singlePericia.descricaocomplementararmadefogo = '';
    globals.singlePericia.tipocartucho = '';
    globals.singlePericia.calibrecartucho = '';
    globals.singlePericia.fabricantecartucho = '';
    globals.singlePericia.numeracaoderastreiocartucho = '';
    globals.singlePericia.descricaocomplementarcartucho = '';
    globals.singlePericia.tipoestojo = '';
    globals.singlePericia.calibreestojo = '';
    globals.singlePericia.fabricanteestojo = '';
    globals.singlePericia.numeracaoderastreioestojo = '';
    globals.singlePericia.descricaocomplementarestojo = '';
    globals.singlePericia.tipoprojetil = '';
    globals.singlePericia.calibreprojetil = '';
    globals.singlePericia.descricaocomplementarprojetil = '';
    globals.singlePericia.tiponucleo = '';
    globals.singlePericia.calibrenucleo = '';
    globals.singlePericia.descricaocomplementarnucleo = '';
    globals.singlePericia.tipocamisa = '';
    globals.singlePericia.calibrecamisa = '';
    globals.singlePericia.descricaocomplementarcamisa = '';
    globals.singlePericia.coletadatiloscopica = '';
    globals.singlePericia.coletapalmar = '';
    globals.singlePericia.coletaplantar = '';
    globals.singlePericia.coletadna = '';
    globals.singlePericia.coletasangue = '';
    globals.singlePericia.coletasemem = '';
    globals.singlePericia.coletapelos = '';
    globals.singlePericia.outrosvestigiosbiologicos = '';
    globals.singlePericia.manchasdesangue = '';
    globals.singlePericia.posicaodono = '';
    globals.singlePericia.tipodeno = '';
    globals.singlePericia.drogasemedicamentos = '';
    globals.singlePericia.outrosvestigios = '';
    globals.singlePericia.anotacoescomplementares = '';
    globals.singlePericia.hipotesepreliminar = '';
    globals.singlePericia.tipificacaopreliminar = '';
    globals.singlePericia.assinaturadoperito = '';
    globals.singlePericia.tipificacaopreliminarhomicidio = '';
    globals.singlePericia.tipificacaopreliminarmorteacidental = '';
    globals.singlePericia.tipificacaopreliminarsuicidio = '';
    globals.singlePericia.manchadesanguepassivatransferencia = '';
    globals.singlePericia.manchadesanguepassivapadraogota = '';
    globals.singlePericia.manchadesanguepassiva = '';
    globals.singlePericia.manchadesanguesalpico = '';
    globals.singlePericia.manchadesanguealteradas = '';
    globals.singlePericia.fasedeputrefacao = '';
    globals.singlePericia.tipolocalinterno = '';
    globals.singlePericia.estruturadeedificacao = '';
    globals.singlePericia.vedacaoexternadaedificacao = '';
    globals.singlePericia.compartimentacaointerna = '';
    globals.singlePericia.estruturadacobertura = '';
    globals.singlePericia.cobertura = '';
    globals.singlePericia.forro = '';
    globals.singlePericia.piso = '';
    globals.singlePericia.esquadriasexternas = '';
    globals.singlePericia.esquadriasinternas = '';
    globals.singlePericia.fechamentodoperimetrodoterreno = '';
    globals.singlePericia.acessoaoterreno = '';
    globals.singlePericia.tipopropriedaderural = '';
    globals.singlePericia.areapropriedaderural = '';
    globals.singlePericia.tipoespacopublico = '';
    globals.singlePericia.pavimentacaoespacopublico = '';
    globals.singlePericia.tipoviapublica = '';
    globals.singlePericia.pavimentacaoviapublica = '';
    globals.singlePericia.calcadaviapublica = '';
    globals.singlePericia.logradouropublico = '';
    globals.singlePericia.tipolocalexterno = '';
    globals.singlePericia.descricaolocalexterno = '';
    globals.singlePericia.qtdecadaveres = '';
    globals.listPericia = [];
  }

  Widget updateButton() {
    if (globals.isUpdated == '0') {
      return RaisedButton(
          child: Icon(Icons.sync),
          textColor: Colors.white,
          color: Colors.amber,
          onPressed: () {
            setState(() {
              _sync();
            });
          });
    } else {
      return Container(
        child: Icon(Icons.check, color: Colors.green, size: 30),
      );
    }
  }

  void _sync() {
    setState(() {
      servicesSurvey.syncronizeData();
      prefs.getUpdated();
    });
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
    });
  }

  @override
  void initState() {
    super.initState();
    prefs.getUpdated();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
  }

  getAddressFromLatLng() async {
    List<Placemark> p = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);

    Placemark place = p[0];

    currentAddress =
        "${place.street}, ${place.name}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}";
    globals.singlePericia.endereco = currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(children: [
            Text("PERÍCIA IML"),
          ]),
        ),
        body: FutureBuilder<bool>(
            future: loadDataAsync(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              return SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  Container(
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Perícias deste dispositivo',
                                                  style:
                                                      TextStyle(fontSize: 30),
                                                ),
                                              ),
                                              Spacer(),
                                              Spacer(),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: updateButton(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              width: 500,
                                              child: Row(
                                                children: <Widget>[
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            countTotal,
                                                            style: TextStyle(
                                                                fontSize: 40,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                          Text(
                                                            'Perícias Realizadas',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ],
                                                      )),
                                                  Spacer(),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            countNotSync,
                                                            style: TextStyle(
                                                                fontSize: 40,
                                                                color: Colors
                                                                    .amber),
                                                          ),
                                                          Text(
                                                            'Perícias Não Sincronizadas',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .amber),
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ]),
                        ),
                      )),
                  Container(
                    child: Card(
                      elevation: 5,
                      child: Row(children: [
                        Container(
                            padding: EdgeInsets.all(10.0),
                            width: 500,
                            height: 350,
                            child: FlutterMap(
                              options: MapOptions(
                                center: LatLng(currentLocation.latitude,
                                    currentLocation.longitude),
                                zoom: 13.0,
                              ),
                              layers: [
                                TileLayerOptions(
                                    urlTemplate:
                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    subdomains: ['a', 'b', 'c']),
                                MarkerLayerOptions(
                                  markers: [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(currentLocation.latitude,
                                          currentLocation.longitude),
                                      builder: (ctx) => Container(
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Expanded(
                          child: Column(children: [
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.location_on),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Local',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption,
                                                    ),
                                                    Text(currentAddress,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Column(children: <Widget>[
                                        Text(
                                          'Data',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ),
                                        Text(
                                          data,
                                          style: TextStyle(
                                              fontSize: 25, color: Colors.blue),
                                        ),
                                      ]),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Hora',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.blue),
                                            ),
                                            Text(
                                              hora,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                width: 280.0,
                                height: 60.0,
                                child: RaisedButton(
                                  child: Text(
                                    'INICIAR NOVA PERÍCIA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    limpaLista();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StartScreen()));
                                  },
                                )),
                          ]),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ));
            }));
  }
}
