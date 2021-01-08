import 'package:flutter/material.dart';
import 'package:pericia_iml/Screens/startsurvey.dart';
import 'package:pericia_iml/Services/prefs.dart';
import 'package:pericia_iml/Services/survey.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pericia_iml/services/globals.dart' as globals;

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

  Future<bool> loadDataAsync() async {
    countTotal = await servicesSurvey.countCollected();
    countNotSync = await servicesSurvey.countNotSyncronized();
    await getUserLocation();
    await getAddressFromLatLng();
    return true;
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
    print('$currentLocation.latitude , $currentLocation.longitude');
  }

  getAddressFromLatLng() async {
    List<Placemark> p = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);

    Placemark place = p[0];

    currentAddress =
        "${place.street}, ${place.name}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}";
    print(currentAddress);
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

              return Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10.0),
                      height: 200,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(7),
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
                      padding: EdgeInsets.all(10.0),
                      height: 450,
                      child: Card(
                        elevation: 5,
                        child: IntrinsicHeight(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(
                                                currentLocation.latitude,
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
                                                  point: LatLng(
                                                      currentLocation.latitude,
                                                      currentLocation
                                                          .longitude),
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
                                        ))),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(Icons
                                                              .location_on),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Local',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .caption,
                                                                ),
                                                                Text(
                                                                    currentAddress,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyText2),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        'Data',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.blue),
                                                      ),
                                                      Text(
                                                        '05/01/2021',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        'Hora',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.blue),
                                                      ),
                                                      Text(
                                                        '15:50',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        )),
                                        Container(
                                            child: Padding(
                                          padding: EdgeInsets.only(top: 50.0),
                                          child: Center(
                                            child: Container(
                                                width: 280.0,
                                                height: 60.0,
                                                child: RaisedButton(
                                                  child: Text(
                                                    'INICIAR NOVA PERÍCIA',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0),
                                                  ),
                                                  textColor: Colors.white,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                StartScreen()));
                                                  },
                                                )),
                                          ),
                                        )),
                                      ]),
                                ),
                              ]),
                        ),
                      )),
                ]),
              );
            }));
  }
}
