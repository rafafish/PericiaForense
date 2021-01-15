import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pericia_iml/services/globals.dart' as globals;
import 'package:pericia_iml/Services/survey.dart';
import 'package:pericia_iml/Screens/home.dart';
import 'package:pericia_iml/Services/prefs.dart';
import 'package:intl/intl.dart';

void main() => runApp(TabForm());

class TabForm extends StatefulWidget {
  @override
  _TabFormState createState() => _TabFormState();
}

class _TabFormState extends State {
  ServicesSurvey servicesSurvey = ServicesSurvey();
  Prefs prefs = Prefs();
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _fbKey = GlobalKey<FormBuilderState>();
  int pmCount = 0;
  int pcCount = 0;
  int ofCount = 0;
  int acCount = 0;
  int relatorCount = 0;
  int showTextFieldQtdeCadaveres = 0;
  int showTextFieldLocalExterno = 0;
  int showFieldsLogradouroPublico = 0;
  int showFieldsViaPublica = 0;
  int showFieldsEspacoPublico = 0;
  int showFieldsPropriedadeRural = 0;
  int showTextFieldLocalInterno = 0;
  int showFieldsPutrefeito = 0;
  int showFieldsManchasDeSanguePassiva = 0;
  int showFieldsManchasDeSangueSalpico = 0;
  int showFieldsManchasDeSangueAlteradas = 0;
  int showFieldsManchaDeSanguePassivaTransferencia = 0;
  int showFieldsManchaDeSanguePassivaPadraoGota = 0;
  int showFieldsTipificacaoPreliminarHomicidio = 0;
  int showFieldsTipificacaoPreliminarMorteAcidental = 0;
  int showFieldsTipificacaoPreliminarSuicidio = 0;
  String data;
  String hora;

  List pmList = [];
  List pcList = [];
  List ofList = [];
  List acList = [];
  List relatorList = [];

  List<String> listaDrogaseMedicamentos = [];
  List<String> listaVestesCadaver = [];
  List<String> listaRoupasIntimasCadaver = [];
  List<String> listaAderecosAdornosCadaver = [];
  List<String> listaSapatosCadaver = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    data = formatter.format(now);
    final DateFormat timeformat = DateFormat('H:m');
    hora = timeformat.format(now);
  }

  void _sync() {
    globals.listPericia.clear();
    globals.listPericia.add(globals.singlePericia.toMap());
    servicesSurvey.insertLocalDB(globals.listPericia);
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

/*       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          (Route<dynamic> route) => false); */
    });
  }

  finalizaForm() {
    _fbKey.currentState.save();

    globals.singlePericia.descricaoendereco =
        _fbKey.currentState.value['descricaoendereco'];
    globals.singlePericia.isolado = _fbKey.currentState.value['isolado'];
    globals.singlePericia.guarnecido = _fbKey.currentState.value['guarnecido'];
    globals.singlePericia.preservado = _fbKey.currentState.value['preservado'];
    globals.singlePericia.statuslocal =
        _fbKey.currentState.value['statuslocal'];
    globals.singlePericia.equipeisolamento =
        _fbKey.currentState.value['equipeisolamento'];
    globals.singlePericia.preservacaolocal =
        _fbKey.currentState.value['preservacaolocal'];
    globals.singlePericia.policialmilitar0 =
        _fbKey.currentState.value['policialmilitar0'];
    globals.singlePericia.policialmilitar1 =
        _fbKey.currentState.value['policialmilitar1'];
    globals.singlePericia.policialcivil0 =
        _fbKey.currentState.value['policialcivil0'];
    globals.singlePericia.policialcivil1 =
        _fbKey.currentState.value['policialcivil1'];
    globals.singlePericia.outrasforcas0 =
        _fbKey.currentState.value['outrasforcas0'];
    globals.singlePericia.outrasforcas1 =
        _fbKey.currentState.value['outrasforcas1'];
    globals.singlePericia.tipoid0 = _fbKey.currentState.value['tipoid0'];
    globals.singlePericia.tipoid1 = _fbKey.currentState.value['tipoid1'];
    globals.singlePericia.numeroid0 = _fbKey.currentState.value['numeroid0'];
    globals.singlePericia.numeroid1 = _fbKey.currentState.value['numeroid1'];
    globals.singlePericia.relator0 = _fbKey.currentState.value['relator0'];
    globals.singlePericia.relator1 = _fbKey.currentState.value['relator1'];
    globals.singlePericia.tipoexame = _fbKey.currentState.value['tipoexame'];
    globals.singlePericia.tipolocal = _fbKey.currentState.value['tipolocal'];
    globals.singlePericia.nomecadaver =
        _fbKey.currentState.value['nomecadaver'];
    globals.singlePericia.tipodocumentocadaver =
        _fbKey.currentState.value['tipodocumentocadaver'];
    globals.singlePericia.numerodocumentocadaver =
        _fbKey.currentState.value['numerodocumentocadaver'];
    globals.singlePericia.idadecadaver =
        _fbKey.currentState.value['idadecadaver'];
    globals.singlePericia.sexocadaver =
        _fbKey.currentState.value['sexocadaver'];
    globals.singlePericia.ocupacao = _fbKey.currentState.value['ocupacao'];
    globals.singlePericia.racacadaver =
        _fbKey.currentState.value['racacadaver'];
    globals.singlePericia.compleicaocadaver =
        _fbKey.currentState.value['compleicaocadaver'];
    globals.singlePericia.cabeloscadaver =
        _fbKey.currentState.value['cabeloscadaver'];
    globals.singlePericia.cordoscabeloscadaver =
        _fbKey.currentState.value['cordoscabeloscadaver'];
    globals.singlePericia.comprimentodoscabeloscadaver =
        _fbKey.currentState.value['comprimentodoscabeloscadaver'];
    globals.singlePericia.pelosfaciaiscadaver =
        _fbKey.currentState.value['pelosfaciaiscadaver'];
    globals.singlePericia.tipotatuagemcadaver =
        _fbKey.currentState.value['tipotatuagemcadaver'];
    globals.singlePericia.localizacaotatuagemcadaver =
        _fbKey.currentState.value['localizacaotatuagemcadaver'];
    globals.singlePericia.descricaocicatrizcadaver =
        _fbKey.currentState.value['descricaocicatrizcadaver'];
    globals.singlePericia.localizacaocicatrizcadaver =
        _fbKey.currentState.value['localizacaocicatrizcadaver'];
    globals.singlePericia.tipopiercingcadaver =
        _fbKey.currentState.value['tipopiercingcadaver'];
    globals.singlePericia.localizacaopiercingcadaver =
        _fbKey.currentState.value['localizacaopiercingcadaver'];
    globals.singlePericia.outrotipodemarcapessoal =
        _fbKey.currentState.value['outrotipodemarcapessoal'];
    listaVestesCadaver = _fbKey.currentState.value['vestescadaver'];
    listaRoupasIntimasCadaver =
        _fbKey.currentState.value['roupasintimascadaver'];
    listaAderecosAdornosCadaver =
        _fbKey.currentState.value['aderecosadornoscadaver'];
    listaSapatosCadaver = _fbKey.currentState.value['sapatoscadaver'];
    globals.singlePericia.posicionamentodocadaver =
        _fbKey.currentState.value['posicionamentodocadaver'];
    globals.singlePericia.posicaomembrosuperiordireito =
        _fbKey.currentState.value['posicaomembrosuperiordireito'];
    globals.singlePericia.posicaomembrosuperioresquerdo =
        _fbKey.currentState.value['posicaomembrosuperioresquerdo'];
    globals.singlePericia.posicaomembroinferiordireito =
        _fbKey.currentState.value['posicaomembroinferiordireito'];
    globals.singlePericia.posicaomembroinferioresquerdo =
        _fbKey.currentState.value['posicaomembroinferioresquerdo'];
    globals.singlePericia.rigidezcadaverica =
        _fbKey.currentState.value['rigidezcadaverica'];
    globals.singlePericia.livoresdehipostase =
        _fbKey.currentState.value['livoresdehipostase'];
    globals.singlePericia.situacaodocadaver =
        _fbKey.currentState.value['situacaodocadaver'];
    globals.singlePericia.tipoarmadefogo =
        _fbKey.currentState.value['tipoarmadefogo'];
    globals.singlePericia.marcaarmadefogo =
        _fbKey.currentState.value['marcaarmadefogo'];
    globals.singlePericia.numerodeseriearmadefogo =
        _fbKey.currentState.value['numerodeseriearmadefogo'];
    globals.singlePericia.calibrearmadefogo =
        _fbKey.currentState.value['calibrearmadefogo'];
    globals.singlePericia.carregadaarmadefogo =
        _fbKey.currentState.value['carregadaarmadefogo'];
    globals.singlePericia.descricaocomplementararmadefogo =
        _fbKey.currentState.value['descricaocomplementararmadefogo'];
    globals.singlePericia.tipocartucho =
        _fbKey.currentState.value['tipocartucho'];
    globals.singlePericia.calibrecartucho =
        _fbKey.currentState.value['calibrecartucho'];
    globals.singlePericia.fabricantecartucho =
        _fbKey.currentState.value['fabricantecartucho'];
    globals.singlePericia.numeracaoderastreiocartucho =
        _fbKey.currentState.value['numeracaoderastreiocartucho'];
    globals.singlePericia.descricaocomplementarcartucho =
        _fbKey.currentState.value['descricaocomplementarcartucho'];
    globals.singlePericia.tipoestojo = _fbKey.currentState.value['tipoestojo'];
    globals.singlePericia.calibreestojo =
        _fbKey.currentState.value['calibreestojo'];
    globals.singlePericia.fabricanteestojo =
        _fbKey.currentState.value['fabricanteestojo'];
    globals.singlePericia.numeracaoderastreioestojo =
        _fbKey.currentState.value['numeracaoderastreioestojo'];
    globals.singlePericia.descricaocomplementarestojo =
        _fbKey.currentState.value['descricaocomplementarestojo'];
    globals.singlePericia.tipoprojetil =
        _fbKey.currentState.value['tipoprojetil'];
    globals.singlePericia.calibreprojetil =
        _fbKey.currentState.value['calibreprojetil'];
    globals.singlePericia.descricaocomplementarprojetil =
        _fbKey.currentState.value['descricaocomplementarprojetil'];
    globals.singlePericia.tiponucleo = _fbKey.currentState.value['tiponucleo'];
    globals.singlePericia.calibrenucleo =
        _fbKey.currentState.value['calibrenucleo'];
    globals.singlePericia.descricaocomplementarnucleo =
        _fbKey.currentState.value['descricaocomplementarnucleo'];
    globals.singlePericia.tipocamisa = _fbKey.currentState.value['tipocamisa'];
    globals.singlePericia.calibrecamisa =
        _fbKey.currentState.value['calibrecamisa'];
    globals.singlePericia.descricaocomplementarcamisa =
        _fbKey.currentState.value['descricaocomplementarcamisa'];
    globals.singlePericia.coletadatiloscopica =
        _fbKey.currentState.value['coletadatiloscopica'];
    globals.singlePericia.coletapalmar =
        _fbKey.currentState.value['coletapalmar'];
    globals.singlePericia.coletaplantar =
        _fbKey.currentState.value['coletaplantar'];
    globals.singlePericia.coletadna = _fbKey.currentState.value['coletadna'];
    globals.singlePericia.coletasangue =
        _fbKey.currentState.value['coletasangue'];
    globals.singlePericia.coletasemem =
        _fbKey.currentState.value['coletasemem'];
    globals.singlePericia.coletapelos =
        _fbKey.currentState.value['coletapelos'];
    globals.singlePericia.outrosvestigiosbiologicos =
        _fbKey.currentState.value['outrosvestigiosbiologicos'];
    globals.singlePericia.manchasdesangue =
        _fbKey.currentState.value['manchasdesangue'];
    globals.singlePericia.posicaodono =
        _fbKey.currentState.value['posicaodono'];
    globals.singlePericia.tipodeno = _fbKey.currentState.value['tipodeno'];
    listaDrogaseMedicamentos = _fbKey.currentState.value['drogasemedicamentos'];
    globals.singlePericia.outrosvestigios =
        _fbKey.currentState.value['outrosvestigios'];
    globals.singlePericia.anotacoescomplementares =
        _fbKey.currentState.value['anotacoescomplementares'];
    globals.singlePericia.hipotesepreliminar =
        _fbKey.currentState.value['hipotesepreliminar'];
    globals.singlePericia.tipificacaopreliminar =
        _fbKey.currentState.value['tipificacaopreliminar'];
    globals.singlePericia.tipificacaopreliminarhomicidio =
        _fbKey.currentState.value['tipificacaopreliminarhomicidio'];
    globals.singlePericia.tipificacaopreliminarmorteacidental =
        _fbKey.currentState.value['tipificacaopreliminarmorteacidental'];
    globals.singlePericia.tipificacaopreliminarsuicidio =
        _fbKey.currentState.value['tipificacaopreliminarsuicidio'];
    globals.singlePericia.manchadesanguepassivatransferencia =
        _fbKey.currentState.value['manchadesanguepassivatransferencia'];
    globals.singlePericia.manchadesanguepassivapadraogota =
        _fbKey.currentState.value['manchadesanguepassivapadraogota'];
    globals.singlePericia.assinaturadoperito = 'null';
    globals.singlePericia.manchadesanguepassiva =
        _fbKey.currentState.value['manchadesanguepassiva'];
    globals.singlePericia.manchadesanguesalpico =
        _fbKey.currentState.value['manchadesanguesalpico'];
    globals.singlePericia.manchadesanguealteradas =
        _fbKey.currentState.value['manchadesanguealteradas'];
    globals.singlePericia.fasedeputrefacao =
        _fbKey.currentState.value['fasedeputrefacao'];
    globals.singlePericia.tipolocalinterno =
        _fbKey.currentState.value['tipolocalinterno'];
    globals.singlePericia.estruturadeedificacao =
        _fbKey.currentState.value['estruturadeedificacao'];
    globals.singlePericia.vedacaoexternadaedificacao =
        _fbKey.currentState.value['vedacaoexternadaedificacao'];
    globals.singlePericia.compartimentacaointerna =
        _fbKey.currentState.value['compartimentacaointerna'];
    globals.singlePericia.estruturadacobertura =
        _fbKey.currentState.value['estruturadacobertura'];
    globals.singlePericia.cobertura = _fbKey.currentState.value['cobertura'];
    globals.singlePericia.forro = _fbKey.currentState.value['forro'];
    globals.singlePericia.piso = _fbKey.currentState.value['piso'];
    globals.singlePericia.esquadriasexternas =
        _fbKey.currentState.value['esquadriasexternas'];
    globals.singlePericia.esquadriasinternas =
        _fbKey.currentState.value['esquadriasinternas'];
    globals.singlePericia.fechamentodoperimetrodoterreno =
        _fbKey.currentState.value['fechamentodoperimetrodoterreno'];
    globals.singlePericia.acessoaoterreno =
        _fbKey.currentState.value['acessoaoterreno'];
    globals.singlePericia.tipopropriedaderural =
        _fbKey.currentState.value['tipopropriedaderural'];
    globals.singlePericia.areapropriedaderural =
        _fbKey.currentState.value['areapropriedaderural'];
    globals.singlePericia.tipoespacopublico =
        _fbKey.currentState.value['tipoespacopublico'];
    globals.singlePericia.pavimentacaoespacopublico =
        _fbKey.currentState.value['pavimentacaoespacopublico'];
    globals.singlePericia.tipoviapublica =
        _fbKey.currentState.value['tipoviapublica'];
    globals.singlePericia.pavimentacaoviapublica =
        _fbKey.currentState.value['pavimentacaoviapublica'];
    globals.singlePericia.calcadaviapublica =
        _fbKey.currentState.value['calcadaviapublica'];
    globals.singlePericia.logradouropublico =
        _fbKey.currentState.value['logradouropublico'];
    globals.singlePericia.tipolocalexterno =
        _fbKey.currentState.value['tipolocalexterno'];
    globals.singlePericia.descricaolocalexterno =
        _fbKey.currentState.value['descricaolocalexterno'];
    globals.singlePericia.qtdecadaveres =
        _fbKey.currentState.value['qtdecadaveres'];
    globals.singlePericia.datahora_fim = DateTime.now().toString();
    globals.singlePericia.regStatus = 'L';

    if (listaDrogaseMedicamentos != null) {
      globals.singlePericia.drogasemedicamentos =
          listaDrogaseMedicamentos.join(',');
    } else {
      globals.singlePericia.drogasemedicamentos = 'null';
    }
    if (listaVestesCadaver != null) {
      globals.singlePericia.vestescadaver = listaVestesCadaver.join(',');
    } else {
      globals.singlePericia.vestescadaver = 'null';
    }
    if (listaRoupasIntimasCadaver != null) {
      globals.singlePericia.roupasintimascadaver =
          listaRoupasIntimasCadaver.join(',');
    } else {
      globals.singlePericia.roupasintimascadaver = 'null';
    }
    if (listaAderecosAdornosCadaver != null) {
      globals.singlePericia.aderecosadornoscadaver =
          listaAderecosAdornosCadaver.join(',');
    } else {
      globals.singlePericia.aderecosadornoscadaver = 'null';
    }
    if (listaSapatosCadaver != null) {
      globals.singlePericia.sapatoscadaver = listaSapatosCadaver.join(',');
    } else {
      globals.singlePericia.sapatoscadaver = 'null';
    }

    print(_fbKey.currentState.value);
    print(globals.singlePericia.toMap());

    _sync();
  }

  showTipificacaoPreliminarHomicidio() {
    if (showFieldsTipificacaoPreliminarHomicidio == 1) {
      return FormBuilderDropdown(
          name: "tipificacaopreliminarhomicidio",
          decoration: InputDecoration(labelText: "HOMICÍDIO"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'ARMA DE FOGO',
            'ARMA BRANCA',
            'ASFIXIA MECÂNICA',
            'ENVENENAMENTO',
            'AGRESSÃO',
            'OUTRO'
          ]
              .map((tipificacaopreliminarhomicidio) => DropdownMenuItem(
                  value: tipificacaopreliminarhomicidio,
                  child: Text("$tipificacaopreliminarhomicidio")))
              .toList());
    } else {
      return Text('');
    }
  }

  showTipificacaoPreliminarMorteAcidental() {
    if (showFieldsTipificacaoPreliminarMorteAcidental == 1) {
      return FormBuilderDropdown(
          name: "tipificacaopreliminarmorteacidental",
          decoration: InputDecoration(labelText: "MORTE ACIDENTAL"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'QUEDA',
            'ACIDENTE DE TRÂNSITO',
            'ATROPELAMENTO',
            'INCÊNDIO',
            'AFOGAMENTO',
            'ELETROPLESSÃO'
                'OUTRO'
          ]
              .map((tipificacaopreliminarmorteacidental) => DropdownMenuItem(
                  value: tipificacaopreliminarmorteacidental,
                  child: Text("$tipificacaopreliminarmorteacidental")))
              .toList());
    } else {
      return Text('');
    }
  }

  showTipificacaoPreliminarSuicidio() {
    if (showFieldsTipificacaoPreliminarSuicidio == 1) {
      return FormBuilderDropdown(
          name: "tipificacaopreliminarsuicidio",
          decoration: InputDecoration(labelText: "SUICÍDIO"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'ENFORCAMENTO',
            'ARMA DE FOGO',
            'ENVENENAMENTO',
            'PROJEÇÃO',
            'OUTRO'
          ]
              .map((tipificacaopreliminarsuicidio) => DropdownMenuItem(
                  value: tipificacaopreliminarsuicidio,
                  child: Text("$tipificacaopreliminarsuicidio")))
              .toList());
    } else {
      return Text('');
    }
  }

  showManchaDeSanguePassivaTransferencia() {
    if (showFieldsManchaDeSanguePassivaTransferencia == 1) {
      return FormBuilderDropdown(
          name: "manchadesanguepassivatransferencia",
          decoration: InputDecoration(labelText: "TRANSFERÊNCIA"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'MOVIMENTO PADRÃO',
            'SATURAÇÃO',
          ]
              .map((manchadesanguepassivatransferencia) => DropdownMenuItem(
                  value: manchadesanguepassivatransferencia,
                  child: Text("$manchadesanguepassivatransferencia")))
              .toList());
    } else {
      return Text('');
    }
  }

  showManchaDeSanguePassivaPadraoGota() {
    if (showFieldsManchaDeSanguePassivaPadraoGota == 1) {
      return FormBuilderDropdown(
          name: "manchadesanguepassivapadraogota",
          decoration: InputDecoration(labelText: "PADRÃO GOTA"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: ['MANCHA DE ORIGEM', 'MANCHA SATÉLITE', 'RASTO DE GOTAS']
              .map((manchadesanguepassivapadraogota) => DropdownMenuItem(
                  value: manchadesanguepassivapadraogota,
                  child: Text("$manchadesanguepassivapadraogota")))
              .toList());
    } else {
      return Text('');
    }
  }

  showManchaDeSanguePassiva() {
    if (showFieldsManchasDeSanguePassiva == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
            name: "manchadesanguepassiva",
            decoration: InputDecoration(labelText: "PASSIVA"),
            // initialValue: 'Male',
            hint: Text('SELECIONE'),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required(context)]),
            items: [
              'TRANSFERÊNCIA',
              'PADRÃO DE FLUXO',
              'PADRÃO DE GOTA',
              'POÇA'
            ]
                .map((manchadesanguepassiva) => DropdownMenuItem(
                    value: manchadesanguepassiva,
                    child: Text("$manchadesanguepassiva")))
                .toList(),
            onChanged: (manchadesanguepassiva) {
              if (manchadesanguepassiva == 'TRANSFERÊNCIA') {
                setState(() {
                  showFieldsManchaDeSanguePassivaTransferencia = 1;
                });
              } else {
                setState(() {
                  showFieldsManchaDeSanguePassivaTransferencia = 0;
                });
              }
              if (manchadesanguepassiva == 'PADRÃO DE GOTA') {
                setState(() {
                  showFieldsManchaDeSanguePassivaPadraoGota = 1;
                });
              } else {
                setState(() {
                  showFieldsManchaDeSanguePassivaPadraoGota = 0;
                });
              }
            },
          ),
          showManchaDeSanguePassivaTransferencia(),
          showManchaDeSanguePassivaPadraoGota()
        ],
      );
    } else {
      return Text('');
    }
  }

  showManchaDeSangueSalpico() {
    if (showFieldsManchasDeSangueSalpico == 1) {
      return FormBuilderDropdown(
          name: "manchadesanguesalpico",
          decoration: InputDecoration(labelText: "SALPICO"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'MECANISMO DE IMPACTO',
            'MECANISMO SECUNDÁRIO',
            'MECANISMO DE PROJEÇÃO',
            'PADRÃO DE BORRIFO',
            'PADRÃO DE IMPACTO',
            'PADRÃO DE NEVOA',
            'SALPICO PARA FRENTE (DIANTEIRO)',
            'SALPICO PARA TRÁS (TRASEIRO)',
            'PADRÃO PROJETADO',
            'PADRÃO DE SANGUE ARTERIAL',
            'PADRÃO DE LANÇAMENTO',
            'PADRÃO DE EXPIRAÇÃO'
          ]
              .map((manchadesanguesalpico) => DropdownMenuItem(
                  value: manchadesanguesalpico,
                  child: Text("$manchadesanguesalpico")))
              .toList());
    } else {
      return Text('');
    }
  }

  showManchaDeSangueAlteradas() {
    if (showFieldsManchasDeSangueAlteradas == 1) {
      return FormBuilderDropdown(
          name: "manchadesanguealteradas",
          decoration: InputDecoration(labelText: "ALTERADAS"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: [
            'COÁGULO',
            'DILUIDA',
            'DIFUSA',
            'INSETOS',
            'VAZIOS',
            'SEQUENCIAÇÃO'
          ]
              .map((manchadesanguealteradas) => DropdownMenuItem(
                  value: manchadesanguealteradas,
                  child: Text("$manchadesanguealteradas")))
              .toList());
    } else {
      return Text('');
    }
  }

  showPutrefeito() {
    if (showFieldsPutrefeito == 1) {
      return FormBuilderDropdown(
          name: "fasedeputrefacao",
          decoration: InputDecoration(labelText: "FASE DE PUTREFAÇÃO"),
          hint: Text('SELECIONE'),
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          items: ['CROMÁTICO', 'ENFISEMATOSO', 'COLIQUATIVO', 'ESQUELETIZAÇÃO']
              .map((fasedeputrefacao) => DropdownMenuItem(
                  value: fasedeputrefacao, child: Text("$fasedeputrefacao")))
              .toList());
    } else {
      return Text('');
    }
  }

  showTipoLocalInterno() {
    if (showTextFieldLocalInterno == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
              name: "tipolocalinterno",
              decoration: InputDecoration(labelText: "TIPO DE LOCAL INTERNO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'IMÓVEL RESIDENCIAL',
                'IMÓVEL COMERCIAL',
                'IMÓVEL DE USO MISTO'
              ]
                  .map((tipolocalinterno) => DropdownMenuItem(
                      value: tipolocalinterno,
                      child: Text("$tipolocalinterno")))
                  .toList()),
          FormBuilderDropdown(
              name: "estruturadeedificacao",
              decoration: InputDecoration(labelText: "ESTRUTURA DA EDIFICAÇÃO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['CONCRETO', 'ALVENARIA', 'MADEIRA', 'AÇO', 'OUTROS']
                  .map((estruturadeedificacao) => DropdownMenuItem(
                      value: estruturadeedificacao,
                      child: Text("$estruturadeedificacao")))
                  .toList()),
          FormBuilderDropdown(
              name: "vedacaoexternadaedificacao",
              decoration:
                  InputDecoration(labelText: "VEDAÇÃO EXTERNA DA EDIFICAÇÃO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'BLOCOS DE ALVENARIA CERÂMICA',
                'BLOCOS DE CONCRETO',
                'MADEIRA',
                'CHAPA DE AÇO',
                'BARRO (ENCHIMENTO)',
                'OUTROS'
              ]
                  .map((vedacaoexternadaedificacao) => DropdownMenuItem(
                      value: vedacaoexternadaedificacao,
                      child: Text("$vedacaoexternadaedificacao")))
                  .toList()),
          FormBuilderDropdown(
              name: "compartimentacaointerna",
              decoration:
                  InputDecoration(labelText: "COMPARTIMENTAÇÃO INTERNA"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'BLOCOS DE ALVENARIA CERÂMICA',
                'BLOCOS DE CONCRETO',
                'MADEIRA',
                'CHAPA DE AÇO',
                'BARRO (ENCHIMENTO)',
                'DIVISÓRIA NAVAL',
                'OUTROS'
              ]
                  .map((compartimentacaointerna) => DropdownMenuItem(
                      value: compartimentacaointerna,
                      child: Text("$compartimentacaointerna")))
                  .toList()),
          FormBuilderDropdown(
              name: "estruturadacobertura",
              decoration: InputDecoration(labelText: "ESTRUTURA DA COBERTURA"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['MADEIRA', 'AÇO', 'OUTRO']
                  .map((estruturadacobertura) => DropdownMenuItem(
                      value: estruturadacobertura,
                      child: Text("$estruturadacobertura")))
                  .toList()),
          FormBuilderDropdown(
              name: "cobertura",
              decoration: InputDecoration(labelText: "COBERTURA"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'TELHA CERÂMICA',
                'TELHA FIBROCIMENTO',
                'TELHA DE CONCRETO',
                'OUTRO'
              ]
                  .map((cobertura) => DropdownMenuItem(
                      value: cobertura, child: Text("$cobertura")))
                  .toList()),
          FormBuilderDropdown(
              name: "forro",
              decoration: InputDecoration(labelText: "FORRO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'SEM FORRO',
                'FORRO EM MADEIRA',
                'FORRO EM PVC',
                'FORRO EM GESSO',
                'FORRO MINERAL',
                'OUTRO'
              ]
                  .map((forro) =>
                      DropdownMenuItem(value: forro, child: Text("$forro")))
                  .toList()),
          FormBuilderDropdown(
              name: "piso",
              decoration: InputDecoration(labelText: "PISO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'CHÃO BATIDO',
                'CIMENTADO/CONCRETO',
                'PISO CERÂMICO',
                'PISO EM PEDRA',
                'PISO ALTA RESISTÊNCIA/KORODUR',
                'PISO EM MADEIRA'
              ]
                  .map((piso) =>
                      DropdownMenuItem(value: piso, child: Text("$piso")))
                  .toList()),
          FormBuilderDropdown(
              name: "esquadriasexternas",
              decoration: InputDecoration(labelText: "ESQUADRIAS EXTERNAS"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'PORTA METÁLICA',
                'PORTA METÁLICA VIDRO',
                'PORTA METÁLICA DE ENROLAR',
                'PORTA DE MADEIRA',
                'PORTA DE MADEIRA/VIDRO',
                'PORTA EM PVC',
                'JANELA EM MADEIRA',
                'JANELA EM MADEIRA/VIDRO',
                'JANELA EM ALUMÍNIO/VIDRO',
                'JANELA METÁLICA/VIDRO',
                'BALANCIM METÁLICO/VIDRO',
                'BALANCIM MADEIRA/VIDRO',
                'OUTROS'
              ]
                  .map((esquadriasexternas) => DropdownMenuItem(
                      value: esquadriasexternas,
                      child: Text("$esquadriasexternas")))
                  .toList()),
          FormBuilderDropdown(
              name: "esquadriasinternas",
              decoration: InputDecoration(labelText: "ESQUADRIAS INTERNAS"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'PORTA METÁLICA',
                'PORTA DE MADEIRA',
                'PORTA DE MADEIRA/VIDRO',
                'PORTA EM PVC',
                'OUTROS'
              ]
                  .map((esquadriasinternas) => DropdownMenuItem(
                      value: esquadriasinternas,
                      child: Text("$esquadriasinternas")))
                  .toList()),
          FormBuilderDropdown(
              name: "fechamentodoperimetrodoterreno",
              decoration: InputDecoration(
                  labelText: "FECHAMENTO DO PERÍMETRO DO TERRENO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'MURO DE ALVENARIA CERÂMICA',
                'MURO DE BLOCOS DE CONCRETO',
                'MURO DE PLACAS DE CONCRETO',
                'CERCA DE MADEIRA',
                'CERCA DE ARAME COM MOURÃO DE CONCRETO',
                'CERCA DE ARAME COM MOURÃO DE MADEIRA',
                'OUTRO TIPO DE FECHAMENTO'
              ]
                  .map((fechamentodoperimetrodoterreno) => DropdownMenuItem(
                      value: fechamentodoperimetrodoterreno,
                      child: Text("$fechamentodoperimetrodoterreno")))
                  .toList()),
          FormBuilderDropdown(
              name: "acessoaoterreno",
              decoration: InputDecoration(labelText: "ACESSO AO TERRENO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['PORTÃO METÁLICO', 'PORTÃO DE MADEIRA', 'OUTRO']
                  .map((acessoaoterreno) => DropdownMenuItem(
                      value: acessoaoterreno, child: Text("$acessoaoterreno")))
                  .toList()),
        ],
      );
    } else {
      return Text('');
    }
  }

  showPropriedadeRural() {
    if (showFieldsPropriedadeRural == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
              name: "tipopropriedaderural",
              decoration: InputDecoration(labelText: "TIPO PROPRIEDADE RURAL"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['SÍTIO', 'FAZENDA', 'OUTROS']
                  .map((tipopropriedaderural) => DropdownMenuItem(
                      value: tipopropriedaderural,
                      child: Text("$tipopropriedaderural")))
                  .toList()),
          FormBuilderDropdown(
              name: "areapropriedaderural",
              decoration: InputDecoration(labelText: "ÁREA PROPRIEDADE RURAL"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['PASTO', 'PLANTAÇÃO', 'OUTROS']
                  .map((areapropriedaderural) => DropdownMenuItem(
                      value: areapropriedaderural,
                      child: Text("$areapropriedaderural")))
                  .toList()),
        ],
      );
    } else {
      return Text('');
    }
  }

  showEspacoPublico() {
    if (showFieldsEspacoPublico == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
              name: "tipoespacopublico",
              decoration:
                  InputDecoration(labelText: "TIPO ESPAÇO PÚBLICO ABERTO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: ['PRAÇA', 'PARQUE', 'QUADRA', 'CAMPO', 'OUTROS']
                  .map((tipoespacopublico) => DropdownMenuItem(
                      value: tipoespacopublico,
                      child: Text("$tipoespacopublico")))
                  .toList()),
          FormBuilderDropdown(
              name: "pavimentacaoespacopublico",
              decoration: InputDecoration(labelText: "PAVIMENTAÇÃO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'SEM PAVIMENTAÇÃO',
                'PEDRA',
                'CIMENTO/CONCRETO',
                'BLOCKRET',
                'OUTROS'
              ]
                  .map((pavimentacaoespacopublico) => DropdownMenuItem(
                      value: pavimentacaoespacopublico,
                      child: Text("$pavimentacaoespacopublico")))
                  .toList()),
        ],
      );
    } else {
      return Text('');
    }
  }

  showViaPublica() {
    if (showFieldsViaPublica == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
              name: "tipoviapublica",
              decoration: InputDecoration(labelText: "TIPO VIA PÚBLICA"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'RODOVIA',
                'ARTERIAL',
                'VIA LOCAL',
                'ESTRADA VICIAL',
                'OUTROS'
              ]
                  .map((tipoviapublica) => DropdownMenuItem(
                      value: tipoviapublica, child: Text("$tipoviapublica")))
                  .toList()),
          FormBuilderDropdown(
              name: "pavimentacaoviapublica",
              decoration: InputDecoration(labelText: "PAVIMENTAÇÃO"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'SEM PAVIMENTAÇÃO',
                'ASFALTO',
                'CIMENTO/CONCRETO',
                'BLOCKRET',
                'OUTROS'
              ]
                  .map((pavimentacaoviapublica) => DropdownMenuItem(
                      value: pavimentacaoviapublica,
                      child: Text("$pavimentacaoviapublica")))
                  .toList()),
          FormBuilderDropdown(
              name: "calcadaviapublica",
              decoration: InputDecoration(labelText: "CALÇADA"),
              // initialValue: 'Male',
              hint: Text('SELECIONE'),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(context)]),
              items: [
                'CIMENTO/CONCRETO',
                'BLOCKRET',
                'PEDRA',
                'REVESTIMENTO CERÂMICO',
                'OUTROS'
              ]
                  .map((calcadaviapublica) => DropdownMenuItem(
                      value: calcadaviapublica,
                      child: Text("$calcadaviapublica")))
                  .toList()),
        ],
      );
    } else {
      return Text('');
    }
  }

  showLogradouroPublico() {
    if (showFieldsLogradouroPublico == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
            name: "logradouropublico",
            decoration: InputDecoration(labelText: "LOGRADOURO PÚBLICO"),
            // initialValue: 'Male',
            hint: Text('SELECIONE'),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required(context)]),
            items: [
              'VIA PÚBLICA',
              'ESPAÇO PÚBLICO ABERTO',
            ]
                .map((logradouropublico) => DropdownMenuItem(
                    value: logradouropublico,
                    child: Text("$logradouropublico")))
                .toList(),
            onChanged: (logradouropublico) {
              if (logradouropublico == 'VIA PÚBLICA') {
                setState(() {
                  showFieldsViaPublica = 1;
                });
              } else {
                setState(() {
                  showFieldsViaPublica = 0;
                });
              }
              if (logradouropublico == 'ESPAÇO PÚBLICO ABERTO') {
                setState(() {
                  showFieldsEspacoPublico = 1;
                });
              } else {
                setState(() {
                  showFieldsEspacoPublico = 0;
                });
              }
            },
          ),
          showViaPublica(),
          showEspacoPublico()
        ],
      );
    } else {
      return Text('');
    }
  }

  showTipoLocalExterno() {
    if (showTextFieldLocalExterno == 1) {
      return Column(
        children: [
          FormBuilderDropdown(
            name: "tipolocalexterno",
            decoration: InputDecoration(labelText: "TIPO LOCAL EXTERNO"),
            // initialValue: 'Male',
            hint: Text('SELECIONE'),
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required(context)]),
            items: [
              'LOGRADOURO PÚBLICO',
              'PROPRIEDADE RURAL',
              'ÁREA DE MATA',
              'ÁREA ALAGADA',
              'PRAIA',
              'MARGEM DE CURSO DE ÁGUA',
              'OUTRO TIPO DE LOCAL EXTERNO'
            ]
                .map((tipolocalexterno) => DropdownMenuItem(
                    value: tipolocalexterno, child: Text("$tipolocalexterno")))
                .toList(),
            onChanged: (tipolocalexterno) {
              if (tipolocalexterno == 'LOGRADOURO PÚBLICO') {
                setState(() {
                  showFieldsLogradouroPublico = 1;
                });
              } else {
                setState(() {
                  showFieldsLogradouroPublico = 0;
                });
              }
              if (tipolocalexterno == 'PROPRIEDADE RURAL') {
                setState(() {
                  showFieldsPropriedadeRural = 1;
                });
              } else {
                setState(() {
                  showFieldsPropriedadeRural = 0;
                });
              }
            },
          ),
          showLogradouroPublico(),
          showPropriedadeRural(),
          FormBuilderTextField(
            name: 'descricaolocalexterno',
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required(context)]),
            decoration: InputDecoration(
                labelText: "DESCRIÇÃO COMPLEMENTAR DO LOCAL EXTERNO"),
          ),
        ],
      );
    } else {
      return Text('');
    }
  }

  showQtdeCadaveres() {
    if (showTextFieldQtdeCadaveres == 1) {
      return FormBuilderTextField(
        name: 'qtdecadaveres',
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(context)]),
        decoration: InputDecoration(labelText: "QUANTIDADE DE CADÁVERES"),
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _fbKey,
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'DADOS DA OCORRÊNCIA',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                                child: Column(
                                  children: [
                                    Text('DATA: $data - HORA: $hora',
                                        style: TextStyle(fontSize: 16.0)),
                                    Text(globals.singlePericia.endereco,
                                        style: TextStyle(fontSize: 16.0)),
                                  ],
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'descricaoendereco',
                                decoration: InputDecoration(
                                    labelText:
                                        "Descrição Complementar do Endereço"),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'ISOLAMENTO DO LOCAL DO CRIME',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[300],
                              ),
                            ),
                            FormBuilderRadioGroup(
                              decoration:
                                  InputDecoration(labelText: 'LOCAL ISOLADO?'),
                              name: 'isolado',
                              validator:
                                  FormBuilderValidators.required(context),
                              options: [
                                'SIM',
                                'NÃO',
                              ]
                                  .map((isolado) =>
                                      FormBuilderFieldOption(value: isolado))
                                  .toList(growable: false),
                            ),
                            FormBuilderRadioGroup(
                              decoration: InputDecoration(
                                  labelText: 'LOCAL GUARNECIDO?'),
                              name: 'guarnecido',
                              validator:
                                  FormBuilderValidators.required(context),
                              options: [
                                'SIM',
                                'NÃO',
                              ]
                                  .map((guarnecido) =>
                                      FormBuilderFieldOption(value: guarnecido))
                                  .toList(growable: false),
                            ),
                            FormBuilderRadioGroup(
                              decoration: InputDecoration(
                                  labelText: 'LOCAL PRESERVADO?'),
                              name: 'preservado',
                              validator:
                                  FormBuilderValidators.required(context),
                              options: [
                                'SIM',
                                'NÃO',
                              ]
                                  .map((preservado) =>
                                      FormBuilderFieldOption(value: preservado))
                                  .toList(growable: false),
                            ),
                            FormBuilderRadioGroup(
                              decoration: InputDecoration(
                                  labelText: 'STATUS DA PRESERVAÇÃO DO LOCAL'),
                              name: 'statuslocal',
                              validator:
                                  FormBuilderValidators.required(context),
                              options: [
                                'IDÔNEO',
                                'INDÔNEO',
                              ]
                                  .map((statuslocal) => FormBuilderFieldOption(
                                      value: statuslocal))
                                  .toList(growable: false),
                            ),
                            FormBuilderTextField(
                              name: 'equipeisolamento',
                              decoration: InputDecoration(
                                  labelText:
                                      "EQUIPE POLICIAL RESPONSÁVEL PELO ISOLAMENTO DO LOCAL"),
                            ),
                            FormBuilderTextField(
                              name: 'preservacaolocal',
                              decoration: InputDecoration(
                                  labelText:
                                      "CONSIDERAÇÕES SOBRE A PRESERVAÇÃO DO LOCAL DO CRIME"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'EQUIPE POLICIAL NO LOCAL DO CRIME',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[300],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'POLÍCIA MILITAR',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: pmList.length,
                                itemBuilder: (context, index) {
                                  return FormBuilderTextField(
                                    name: 'policialmilitar$index',
                                    decoration: InputDecoration(
                                      labelText: pmList[index],
                                      counterText: "",
                                      prefixIcon: const Icon(Icons.person),
                                      suffixIcon: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () => setState(() {
                                                setState(() {
                                                  pmList.removeAt(index);
                                                  pmCount--;
                                                });
                                              })),
                                    ),
                                  );
                                }),
                            MaterialButton(
                              child: Text(
                                "ADICIONAR POLICIAL MILITAR",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  pmCount++;
                                  pmList.add('Polícial Militar $pmCount');
                                });
                              },
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'POLÍCIA CIVIL',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: pcList.length,
                                itemBuilder: (context, index) {
                                  return FormBuilderTextField(
                                    name: 'policialcivil$index',
                                    decoration: InputDecoration(
                                      labelText: pcList[index],
                                      counterText: "",
                                      prefixIcon: const Icon(Icons.person),
                                      suffixIcon: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () => setState(() {
                                                setState(() {
                                                  pcList.removeAt(index);
                                                  pcCount--;
                                                });
                                              })),
                                    ),
                                  );
                                }),
                            MaterialButton(
                              child: Text(
                                "ADICIONAR POLICIAL CIVIL",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  pcCount++;
                                  pcList.add('Polícial Civil $pcCount');
                                });
                              },
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'OUTRAS FORÇAS',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ofList.length,
                                itemBuilder: (context, index) {
                                  return FormBuilderTextField(
                                    name: 'outrasforcas$index',
                                    decoration: InputDecoration(
                                      labelText: ofList[index],
                                      counterText: "",
                                      prefixIcon: const Icon(Icons.person),
                                      suffixIcon: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () => setState(() {
                                                setState(() {
                                                  ofList.removeAt(index);
                                                  ofCount--;
                                                });
                                              })),
                                    ),
                                  );
                                }),
                            MaterialButton(
                              child: Text(
                                "ADICIONAR MEMBRO DE OUTRAS FORÇAS",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  ofCount++;
                                  ofList.add('Outras Forças $ofCount');
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              Text(
                                'ACOMPANHANTE DA PERÍCIA',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300],
                                ),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: acList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                            left: 16.0,
                                            top: 24.0,
                                            bottom: 8.0,
                                          ),
                                          child: Text(
                                            'Acompanhante de Perícia $index',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        FormBuilderDropdown(
                                          name: "tipoid$index",
                                          decoration: InputDecoration(
                                              labelText:
                                                  "DOCUMENTO DE IDENTIFICAÇÃO"),
                                          // initialValue: 'Male',
                                          hint: Text('SELECIONE'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                                context)
                                          ]),
                                          items: ['RG', 'CPF', 'CNH']
                                              .map((tipoid) => DropdownMenuItem(
                                                  value: tipoid,
                                                  child: Text("$tipoid")))
                                              .toList(),
                                        ),
                                        FormBuilderTextField(
                                          name: 'numeroid$index',
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                                context)
                                          ]),
                                          decoration: InputDecoration(
                                              labelText: "NÚMERO DO DOCUMENTO"),
                                        ),
                                        Container(
                                            alignment: Alignment.topRight,
                                            child: MaterialButton(
                                              child: Text(
                                                "Remover",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Colors.deepOrange,
                                              onPressed: () {
                                                setState(() {
                                                  acList.removeAt(index);
                                                  acCount--;
                                                });
                                              },
                                            ))
                                      ],
                                    );
                                  }),
                              Divider(),
                              MaterialButton(
                                child: Text(
                                  "ADICIONAR ACOMPANHANTE DA PERÍCIA",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green,
                                onPressed: () {
                                  setState(() {
                                    acCount++;
                                    acList.add(
                                        'Acompanhante de Perícia $acCount');
                                  });
                                },
                              ),
                            ]))),
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              Text(
                                'HISTÓRICO',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'RELATOS',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: relatorList.length,
                                  itemBuilder: (context, index) {
                                    return FormBuilderTextField(
                                      name: 'relator$index',
                                      decoration: InputDecoration(
                                        labelText: relatorList[index],
                                        counterText: "",
                                        prefixIcon: const Icon(Icons.person),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.clear),
                                            onPressed: () => setState(() {
                                                  setState(() {
                                                    relatorList.removeAt(index);
                                                    relatorCount--;
                                                  });
                                                })),
                                      ),
                                    );
                                  }),
                              MaterialButton(
                                child: Text(
                                  "ADICIONAR RELATOR",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green,
                                onPressed: () {
                                  setState(() {
                                    relatorCount++;
                                    relatorList.add('Relator $relatorCount');
                                  });
                                },
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'TIPO DE EXAME',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              FormBuilderDropdown(
                                name: "tipoexame",
                                decoration:
                                    InputDecoration(labelText: "TIPO DE EXAME"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),

                                items: [
                                  'LOCAL DO CRIME SEM CADÁVER',
                                  'LOCAL DO CRIME COM CADÁVER'
                                ]
                                    .map((tipoexame) => DropdownMenuItem(
                                        value: tipoexame,
                                        child: Text("$tipoexame")))
                                    .toList(),
                                onChanged: (tipoexame) {
                                  if (tipoexame ==
                                      'LOCAL DO CRIME COM CADÁVER') {
                                    setState(() {
                                      showTextFieldQtdeCadaveres = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showTextFieldQtdeCadaveres = 0;
                                    });
                                  }
                                },
                              ),
                              showQtdeCadaveres(),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'DESCRIÇÃO DO LOCAL',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              FormBuilderDropdown(
                                name: "tipolocal",
                                decoration:
                                    InputDecoration(labelText: "TIPO DE LOCAL"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),

                                items: [
                                  'LOCAL EXTERNO',
                                  'LOCAL INTERNO',
                                  'MISTO'
                                ]
                                    .map((tipolocal) => DropdownMenuItem(
                                        value: tipolocal,
                                        child: Text("$tipolocal")))
                                    .toList(),
                                onChanged: (tipolocal) {
                                  if (tipolocal == 'LOCAL EXTERNO') {
                                    setState(() {
                                      showTextFieldLocalExterno = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showTextFieldLocalExterno = 0;
                                      showFieldsLogradouroPublico = 0;
                                      showFieldsViaPublica = 0;
                                      showFieldsEspacoPublico = 0;
                                      showFieldsPropriedadeRural = 0;
                                    });
                                  }
                                  if (tipolocal == 'LOCAL INTERNO') {
                                    setState(() {
                                      showTextFieldLocalInterno = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showTextFieldLocalInterno = 0;
                                    });
                                  }
                                },
                              ),
                              showTipoLocalExterno(),
                              showTipoLocalInterno(),
                              Divider(),
                            ]))),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'DESCRIÇÃO DO CADÁVER',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[300],
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'nomecadaver',
                              decoration: InputDecoration(labelText: "NOME"),
                            ),
                            FormBuilderDropdown(
                              name: "tipodocumentocadaver",
                              decoration: InputDecoration(
                                  labelText: "DOCUMENTO DE IDENTIFICAÇÃO"),
                              // initialValue: 'Male',
                              hint: Text('SELECIONE'),

                              items: ['RG', 'CPF', 'CNH']
                                  .map((tipodocumentocadaver) =>
                                      DropdownMenuItem(
                                          value: tipodocumentocadaver,
                                          child: Text("$tipodocumentocadaver")))
                                  .toList(),
                            ),
                            FormBuilderTextField(
                              name: 'numerodocumentocadaver',
                              decoration: InputDecoration(
                                  labelText: "NÚMERO DO DOCUMENTO"),
                            ),
                            FormBuilderTextField(
                              name: 'idadecadaver',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "IDADE"),
                            ),
                            FormBuilderDropdown(
                              name: "sexocadaver",
                              decoration: InputDecoration(labelText: "SEXO"),
                              // initialValue: 'Male',
                              hint: Text('SELECIONE'),

                              items: ['MASCULINO', 'FEMININO']
                                  .map((tipodocumentocadaver) =>
                                      DropdownMenuItem(
                                          value: tipodocumentocadaver,
                                          child: Text("$tipodocumentocadaver")))
                                  .toList(),
                            ),
                            FormBuilderTextField(
                              name: 'ocupacao',
                              decoration:
                                  InputDecoration(labelText: "OCUPAÇÃO"),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'CARÁCTERISTICAS',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            FormBuilderDropdown(
                                name: "racacadaver",
                                decoration: InputDecoration(labelText: "RAÇA"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'NEGRO',
                                  'BRANCO',
                                  'PARDO',
                                  'ORIENTAL',
                                  'ÍNDIO',
                                  'OUTRO'
                                ]
                                    .map((racacadaver) => DropdownMenuItem(
                                        value: racacadaver,
                                        child: Text("$racacadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "compleicaocadaver",
                                decoration:
                                    InputDecoration(labelText: "COMPLEIÇÃO"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'FRANZINA',
                                  'MEDIANA',
                                  'ROBUSTA',
                                ]
                                    .map((compleicaocadaver) =>
                                        DropdownMenuItem(
                                            value: compleicaocadaver,
                                            child: Text("$compleicaocadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "cabeloscadaver",
                                decoration:
                                    InputDecoration(labelText: "CABELOS"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'LISO',
                                  'CRESPO',
                                  'ONDULADO',
                                  'CARECA',
                                  'OUTRO'
                                ]
                                    .map((cabeloscadaver) => DropdownMenuItem(
                                        value: cabeloscadaver,
                                        child: Text("$cabeloscadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "cordoscabeloscadaver",
                                decoration: InputDecoration(
                                    labelText: "COR DOS CABELOS"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'PRETO',
                                  'CASTANHO',
                                  'LOURO',
                                  'RUIVO',
                                  'GRISALHO'
                                      'OUTRO'
                                ]
                                    .map((cordoscabeloscadaver) =>
                                        DropdownMenuItem(
                                            value: cordoscabeloscadaver,
                                            child:
                                                Text("$cordoscabeloscadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "comprimentodoscabeloscadaver",
                                decoration: InputDecoration(
                                    labelText: "COMPRIMENTO DOS CABELOS"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'LONGO',
                                  'CURTO',
                                  'MILITAR',
                                ]
                                    .map((comprimentodoscabeloscadaver) =>
                                        DropdownMenuItem(
                                            value: comprimentodoscabeloscadaver,
                                            child: Text(
                                                "$comprimentodoscabeloscadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "pelosfaciaiscadaver",
                                decoration:
                                    InputDecoration(labelText: "PELOS FACIAIS"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'NÃO',
                                  'BARBA',
                                  'BIGODE',
                                ]
                                    .map((pelosfaciaiscadaver) =>
                                        DropdownMenuItem(
                                            value: pelosfaciaiscadaver,
                                            child:
                                                Text("$pelosfaciaiscadaver")))
                                    .toList()),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'MARCAS PESSOAIS',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'TATUAGENS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'tipotatuagemcadaver',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "TIPO"),
                            ),
                            FormBuilderTextField(
                              name: 'localizacaotatuagemcadaver',
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "LOCALIZAÇÃO"),
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'CICATRIZES',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'descricaocicatrizcadaver',
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "DESCRIÇÃO"),
                            ),
                            FormBuilderTextField(
                              name: 'localizacaocicatrizcadaver',
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "LOCALIZAÇÃO"),
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'PIERCINGS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'tipopiercingcadaver',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "TIPO"),
                            ),
                            FormBuilderTextField(
                              name: 'localizacaopiercingcadaver',
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "LOCALIZAÇÃO"),
                            ),
                            Divider(),
                            FormBuilderTextField(
                              name: 'outrotipodemarcapessoal',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "OUTRO TIPO DE MARCA PESSOAL"),
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'VESTES',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderCheckboxGroup(
                              name: "vestescadaver",
                              options: [
                                FormBuilderFieldOption(value: "BERMUDA"),
                                FormBuilderFieldOption(value: "CALÇA"),
                                FormBuilderFieldOption(value: "SHORT"),
                                FormBuilderFieldOption(value: "SAIA MÉDIA"),
                                FormBuilderFieldOption(value: "MINISAIA"),
                                FormBuilderFieldOption(
                                    value: "CAMISETA MANGA LONGA"),
                                FormBuilderFieldOption(
                                    value: "CAMISETA MANGA CURTA"),
                                FormBuilderFieldOption(
                                    value: "CAMISETA SEM MANGAS"),
                                FormBuilderFieldOption(
                                    value: "CAMISA SOCIAL MANDA CURTA"),
                                FormBuilderFieldOption(
                                    value: "CAMISA SOCIAL MANDA LONGA"),
                                FormBuilderFieldOption(value: "TOP"),
                                FormBuilderFieldOption(value: "BLUSA"),
                                FormBuilderFieldOption(value: "VESTIDO LONGO"),
                                FormBuilderFieldOption(value: "VESTIDO CURTO"),
                                FormBuilderFieldOption(value: "OUTRO")
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'ROUPAS ÍNTIMAS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderCheckboxGroup(
                              name: "roupasintimascadaver",
                              options: [
                                FormBuilderFieldOption(value: "SUNGA"),
                                FormBuilderFieldOption(value: "CUECA"),
                                FormBuilderFieldOption(value: "CALCINHA"),
                                FormBuilderFieldOption(value: "SUTIÃ"),
                                FormBuilderFieldOption(value: "CINTA"),
                                FormBuilderFieldOption(value: "OUTRO")
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'ADEREÇOS/ADORNOS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderCheckboxGroup(
                              name: "aderecosadornoscadaver",
                              options: [
                                FormBuilderFieldOption(value: "CINTO"),
                                FormBuilderFieldOption(value: "RELÓGIO"),
                                FormBuilderFieldOption(value: "ANEL"),
                                FormBuilderFieldOption(value: "PULSEIRA"),
                                FormBuilderFieldOption(value: "BRINCO"),
                                FormBuilderFieldOption(value: "CORDÃO/COLAR"),
                                FormBuilderFieldOption(value: "ÓCULOS"),
                                FormBuilderFieldOption(value: "OUTROS")
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'SAPATOS',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            FormBuilderCheckboxGroup(
                              name: "sapatoscadaver",
                              options: [
                                FormBuilderFieldOption(value: "SOCIAL"),
                                FormBuilderFieldOption(value: "TENIS"),
                                FormBuilderFieldOption(value: "SANDÁLIAS"),
                                FormBuilderFieldOption(value: "SALTO ALTO"),
                                FormBuilderFieldOption(value: "SALTO BAIXO"),
                                FormBuilderFieldOption(value: "OUTROS")
                              ],
                            ),
                            Divider(),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                top: 24.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                'DETALHAMENTO DO CADÁVER',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            FormBuilderDropdown(
                                name: "posicionamentodocadaver",
                                decoration: InputDecoration(
                                    labelText: "POSICIONAMENTO DO CADÁVER"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),
                                items: [
                                  'DECÚBITO VENTRAL',
                                  'DECÚBITO DORSAL',
                                  'DECÚBITO LATERAL DIREITO',
                                  'DECÚBITO LATERAL ESQUERDO',
                                  'SENTADO',
                                  'PENDURADO',
                                ]
                                    .map((posicionamentodocadaver) =>
                                        DropdownMenuItem(
                                            value: posicionamentodocadaver,
                                            child: Text(
                                                "$posicionamentodocadaver")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "posicaomembrosuperiordireito",
                                decoration: InputDecoration(
                                    labelText:
                                        "POSICIONAMENTO DO MEMBRO SUPERIOR DIREITO"),
                                hint: Text('SELECIONE'),
                                items: [
                                  'DISTENDIDO',
                                  'FLEXIONADO',
                                ]
                                    .map((posicaomembrosuperiordireito) =>
                                        DropdownMenuItem(
                                            value: posicaomembrosuperiordireito,
                                            child: Text(
                                                "$posicaomembrosuperiordireito")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "posicaomembrosuperioresquerdo",
                                decoration: InputDecoration(
                                    labelText:
                                        "POSICIONAMENTO DO MEMBRO SUPERIOR ESQUERDO"),
                                hint: Text('SELECIONE'),
                                items: [
                                  'DISTENDIDO',
                                  'FLEXIONADO',
                                ]
                                    .map((posicaomembrosuperioresquerdo) =>
                                        DropdownMenuItem(
                                            value:
                                                posicaomembrosuperioresquerdo,
                                            child: Text(
                                                "$posicaomembrosuperioresquerdo")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "posicaomembroinferiordireito",
                                decoration: InputDecoration(
                                    labelText:
                                        "POSICIONAMENTO DO MEMBRO INFERIOR DIREITO"),
                                hint: Text('SELECIONE'),
                                items: [
                                  'DISTENDIDO',
                                  'FLEXIONADO',
                                ]
                                    .map((posicaomembroinferiordireito) =>
                                        DropdownMenuItem(
                                            value: posicaomembroinferiordireito,
                                            child: Text(
                                                "$posicaomembroinferiordireito")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "posicaomembroinferioresquerdo",
                                decoration: InputDecoration(
                                    labelText:
                                        "POSICIONAMENTO DO MEMBRO INFERIOR ESQUERDO"),
                                hint: Text('SELECIONE'),
                                items: [
                                  'DISTENDIDO',
                                  'FLEXIONADO',
                                ]
                                    .map((posicaomembroinferioresquerdo) =>
                                        DropdownMenuItem(
                                            value:
                                                posicaomembroinferioresquerdo,
                                            child: Text(
                                                "$posicaomembroinferioresquerdo")))
                                    .toList()),
                            FormBuilderDropdown(
                                name: "rigidezcadaverica",
                                decoration: InputDecoration(
                                    labelText: "RIGIDEZ CADAVÉRICA"),
                                hint: Text('SELECIONE'),
                                items: ['TOTAL', 'PARCIAL', 'FLÁCIDO']
                                    .map((rigidezcadaverica) =>
                                        DropdownMenuItem(
                                            value: rigidezcadaverica,
                                            child: Text("$rigidezcadaverica")))
                                    .toList()),
                            FormBuilderTextField(
                              name: 'livoresdehipostase',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "LIVORES DE HIPÓSTASE"),
                            ),
                            FormBuilderDropdown(
                              name: "situacaodocadaver",
                              decoration: InputDecoration(
                                  labelText: "SITUAÇÃO DO CADÁVER"),
                              // initialValue: 'Male',
                              hint: Text('SELECIONE'),

                              items: [
                                'PUTREFEITO',
                                'CARBONIZADO',
                                'ESQUARTEJADO'
                              ]
                                  .map((situacaodocadaver) => DropdownMenuItem(
                                      value: situacaodocadaver,
                                      child: Text("$situacaodocadaver")))
                                  .toList(),
                              onChanged: (situacaodocadaver) {
                                if (situacaodocadaver == 'PUTREFEITO') {
                                  setState(() {
                                    showFieldsPutrefeito = 1;
                                  });
                                } else {
                                  setState(() {
                                    showFieldsPutrefeito = 0;
                                  });
                                }
                              },
                            ),
                            showPutrefeito(),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              Text(
                                'DETALHAMENTO DOS VESTÍGIOS',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tipoarmadefogo',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'marcaarmadefogo',
                                decoration: InputDecoration(labelText: "MARCA"),
                              ),
                              FormBuilderTextField(
                                name: 'numerodeseriearmadefogo',
                                decoration: InputDecoration(
                                    labelText: "NÚMERO DE SÉRIE"),
                              ),
                              FormBuilderTextField(
                                name: 'calibrearmadefogo',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderRadioGroup(
                                decoration:
                                    InputDecoration(labelText: 'CARREGADA?'),
                                name: 'carregadaarmadefogo',
                                options: [
                                  'SIM',
                                  'NÃO',
                                ]
                                    .map((carregadaarmadefogo) =>
                                        FormBuilderFieldOption(
                                            value: carregadaarmadefogo))
                                    .toList(growable: false),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementararmadefogo',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'CARTUCHO DE ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tipocartucho',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'calibrecartucho',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderTextField(
                                name: 'fabricantecartucho',
                                decoration:
                                    InputDecoration(labelText: "FABRICANTE"),
                              ),
                              FormBuilderTextField(
                                name: 'numeracaoderastreiocartucho',
                                decoration: InputDecoration(
                                    labelText: "NUMERAÇÃO DE RASTREIO"),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementarcartucho',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'ESTOJO DE PROJÉTIL DE ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tipoestojo',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'calibreestojo',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderTextField(
                                name: 'fabricanteestojo',
                                decoration:
                                    InputDecoration(labelText: "FABRICANTE"),
                              ),
                              FormBuilderTextField(
                                name: 'numeracaoderastreioestojo',
                                decoration: InputDecoration(
                                    labelText: "NUMERAÇÃO DE RASTREIO"),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementarestojo',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'PROJÉTIL DE ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tipoprojetil',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'calibreprojetil',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementarprojetil',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'NÚCLEO DE PROJÉTIL DE ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tiponucleo',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'calibrenucleo',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementarnucleo',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'CAMISA DE PROJÉTIL DE ARMA DE FOGO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'tipocamisa',
                                decoration: InputDecoration(labelText: "TIPO"),
                              ),
                              FormBuilderTextField(
                                name: 'calibrecamisa',
                                decoration:
                                    InputDecoration(labelText: "CALIBRE"),
                              ),
                              FormBuilderTextField(
                                name: 'descricaocomplementarcamisa',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO COMPLEMENTAR"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'VESTIGIO PAPILOSCÓPICO',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'FRAGMENTO DE IMPRESSÃO DATILOSCÓPICA',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletadatiloscopica',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'FRAGMENTO DE IMPRESSÃO PALMAR',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletapalmar',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'FRAGMENTO DE IMPRESSÃO PLANTAR',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletaplantar',
                                decoration: InputDecoration(
                                    labelText: "DESCRIÇÃO DA COLETA"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'VESTIGIO BIOLÓGICO',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'DNA',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletadna',
                                decoration: InputDecoration(
                                    labelText:
                                        "DESCRIÇÃO DA BASE E LOCAL DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'SANGUE',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletasangue',
                                decoration: InputDecoration(
                                    labelText:
                                        "DESCRIÇÃO DA BASE E LOCAL DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'SEMEM',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletasemem',
                                decoration: InputDecoration(
                                    labelText:
                                        "DESCRIÇÃO DA BASE E LOCAL DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'PELOS',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'coletapelos',
                                decoration: InputDecoration(
                                    labelText:
                                        "DESCRIÇÃO DA BASE E LOCAL DA COLETA"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'OUTROS VESTÍGIOS BIOLÓGICOS',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'outrosvestigiosbiologicos',
                                decoration: InputDecoration(
                                    labelText:
                                        "DESCRIÇÃO DA BASE E LOCAL DA COLETA"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'MANCHAS DE SANGUE',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              FormBuilderDropdown(
                                name: "manchasdesangue",
                                decoration: InputDecoration(
                                    labelText: "MANCHAS DE SANGUE"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),

                                items: ['PASSIVA', 'SALPICO', 'ALTERADAS']
                                    .map((manchasdesangue) => DropdownMenuItem(
                                        value: manchasdesangue,
                                        child: Text("$manchasdesangue")))
                                    .toList(),
                                onChanged: (manchasdesangue) {
                                  if (manchasdesangue == 'PASSIVA') {
                                    setState(() {
                                      showFieldsManchasDeSanguePassiva = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsManchasDeSanguePassiva = 0;
                                    });
                                  }
                                  if (manchasdesangue == 'SALPICO') {
                                    setState(() {
                                      showFieldsManchasDeSangueSalpico = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsManchasDeSangueSalpico = 0;
                                    });
                                  }
                                  if (manchasdesangue == 'ALTERADAS') {
                                    setState(() {
                                      showFieldsManchasDeSangueAlteradas = 1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsManchasDeSangueAlteradas = 0;
                                    });
                                  }
                                },
                              ),
                              showManchaDeSanguePassiva(),
                              showManchaDeSangueSalpico(),
                              showManchaDeSangueAlteradas(),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'CORDA (ENFORCAMENTO)',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              FormBuilderDropdown(
                                  name: "posicaodono",
                                  decoration: InputDecoration(
                                      labelText: "POSIÇÃO DO NÓ"),
                                  hint: Text('SELECIONE'),
                                  items: ['POSTERIOR', 'LATERAL', 'ANTERIOR']
                                      .map((posicaodono) => DropdownMenuItem(
                                          value: posicaodono,
                                          child: Text("$posicaodono")))
                                      .toList()),
                              FormBuilderTextField(
                                name: 'tipodeno',
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: "TIPO DE NÓ"),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'DROGAS/MEDICAMENTOS',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              FormBuilderCheckboxGroup(
                                name: "drogasemedicamentos",
                                options: [
                                  FormBuilderFieldOption(value: "MACONHA"),
                                  FormBuilderFieldOption(value: "COCAÍNA"),
                                  FormBuilderFieldOption(value: "OXI"),
                                  FormBuilderFieldOption(value: "MDMDA"),
                                  FormBuilderFieldOption(value: "LSD"),
                                  FormBuilderFieldOption(
                                      value: "MEDICAMENTO CONTROLADO"),
                                  FormBuilderFieldOption(value: "OUTROS")
                                ],
                              ),
                              FormBuilderTextField(
                                name: 'outrosvestigios',
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "OUTROS VESTÍGIOS"),
                              ),
                            ]))),
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              Text(
                                'COMPLEMENTO DA PERÍCIA',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300],
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'anotacoescomplementares',
                                decoration: InputDecoration(
                                    labelText: "ANOTAÇÕES COMPLEMENTARES"),
                              ),
                              FormBuilderTextField(
                                name: 'hipotesepreliminar',
                                decoration: InputDecoration(
                                    labelText:
                                        "HIPÓTESE PRELIMINAR DA DINÂMICA DO EVENTO"),
                              ),
                              FormBuilderDropdown(
                                name: "tipificacaopreliminar",
                                decoration: InputDecoration(
                                    labelText:
                                        "TIPIFICAÇÃO PRELIMINAR/MEIO EMPREGADO"),
                                // initialValue: 'Male',
                                hint: Text('SELECIONE'),

                                items: [
                                  'HOMICÍDIO',
                                  'MORTE ACIDENTAL',
                                  'SUICÍDIO'
                                ]
                                    .map((tipificacaopreliminar) =>
                                        DropdownMenuItem(
                                            value: tipificacaopreliminar,
                                            child:
                                                Text("$tipificacaopreliminar")))
                                    .toList(),
                                onChanged: (tipificacaopreliminar) {
                                  if (tipificacaopreliminar == 'HOMICÍDIO') {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarHomicidio =
                                          1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarHomicidio =
                                          0;
                                    });
                                  }
                                  if (tipificacaopreliminar ==
                                      'MORTE ACIDENTAL') {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarMorteAcidental =
                                          1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarMorteAcidental =
                                          0;
                                    });
                                  }
                                  if (tipificacaopreliminar == 'SUICÍDIO') {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarSuicidio =
                                          1;
                                    });
                                  } else {
                                    setState(() {
                                      showFieldsTipificacaoPreliminarSuicidio =
                                          0;
                                    });
                                  }
                                },
                              ),
                              showTipificacaoPreliminarHomicidio(),
                              showTipificacaoPreliminarMorteAcidental(),
                              showTipificacaoPreliminarSuicidio(),
                              Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                  top: 24.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  'ASSINATURA DO PERÍTO',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              FormBuilderSignaturePad(
                                decoration: InputDecoration(
                                  labelText: "ASSINATURA DO PERÍTO",
                                ),
                                name: "assinaturadoperito",
                                height: 100,
                                clearButtonText: "LIMPAR",
                              ),
                            ])))
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text(
                      "ENVIAR PERÍCIA",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      finalizaForm();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
