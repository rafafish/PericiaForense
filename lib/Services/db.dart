import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database _database;

  Future<Database> openDB() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), 'imldb.db'),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE survey(id TEXT,datahora_inicio TEXT,datahora_fim TEXT,latitude TEXT,longitude TEXT,endereco TEXT,descricaoendereco TEXT,isolado TEXT,guarnecido TEXT,preservado TEXT,statuslocal TEXT,equipeisolamento TEXT,preservacaolocal TEXT,policialmilitar0 TEXT,policialmilitar1 TEXT,policialcivil0 TEXT,policialcivil1 TEXT,outrasforcas0 TEXT,outrasforcas1 TEXT,tipoid0 TEXT,tipoid1 TEXT,numeroid0 TEXT,numeroid1 TEXT,relator0 TEXT,relator1 TEXT,tipoexame TEXT,tipolocal TEXT,nomecadaver TEXT,tipodocumentocadaver TEXT,numerodocumentocadaver TEXT,idadecadaver TEXT,sexocadaver TEXT,ocupacao TEXT,racacadaver TEXT,compleicaocadaver TEXT,cabeloscadaver TEXT,cordoscabeloscadaver TEXT,comprimentodoscabeloscadaver TEXT,pelosfaciaiscadaver TEXT,tipotatuagemcadaver TEXT,localizacaotatuagemcadaver TEXT,descricaocicatrizcadaver TEXT,localizacaocicatrizcadaver TEXT,tipopiercingcadaver TEXT,localizacaopiercingcadaver TEXT,outrotipodemarcapessoal TEXT,vestescadaver TEXT,roupasintimascadaver TEXT,aderecosadornoscadaver TEXT,sapatoscadaver TEXT,posicionamentodocadaver TEXT,posicaomembrosuperiordireito TEXT,posicaomembrosuperioresquerdo TEXT,posicaomembroinferiordireito TEXT,posicaomembroinferioresquerdo TEXT,rigidezcadaverica TEXT,livoresdehipostase TEXT,situacaodocadaver TEXT,tipoarmadefogo TEXT,marcaarmadefogo TEXT,numerodeseriearmadefogo TEXT,calibrearmadefogo TEXT,carregadaarmadefogo TEXT,descricaocomplementararmadefogo TEXT,tipocartucho TEXT,calibrecartucho TEXT,fabricantecartucho TEXT,numeracaoderastreiocartucho TEXT,descricaocomplementarcartucho TEXT,tipoestojo TEXT,calibreestojo TEXT,fabricanteestojo TEXT,numeracaoderastreioestojo TEXT,descricaocomplementarestojo TEXT,tipoprojetil TEXT,calibreprojetil TEXT,descricaocomplementarprojetil TEXT,tiponucleo TEXT,calibrenucleo TEXT,descricaocomplementarnucleo TEXT,tipocamisa TEXT,calibrecamisa TEXT,descricaocomplementarcamisa TEXT,coletadatiloscopica TEXT,coletapalmar TEXT,coletaplantar TEXT,coletadna TEXT,coletasangue TEXT,coletasemem TEXT,coletapelos TEXT,outrosvestigiosbiologicos TEXT,manchasdesangue TEXT,posicaodono TEXT,tipodeno TEXT,drogasemedicamentos TEXT,outrosvestigios TEXT,anotacoescomplementares TEXT,hipotesepreliminar TEXT,tipificacaopreliminar TEXT,assinaturadoperito TEXT,tipificacaopreliminarhomicidio TEXT,tipificacaopreliminarmorteacidental TEXT,tipificacaopreliminarsuicidio TEXT,manchadesanguepassivatransferencia TEXT,manchadesanguepassivapadraogota TEXT,manchadesanguepassiva TEXT,manchadesanguesalpico TEXT,manchadesanguealteradas TEXT,fasedeputrefacao TEXT,tipolocalinterno TEXT,estruturadeedificacao TEXT,vedacaoexternadaedificacao TEXT,compartimentacaointerna TEXT,estruturadacobertura TEXT,cobertura TEXT,forro TEXT,piso TEXT,esquadriasexternas TEXT,esquadriasinternas TEXT,fechamentodoperimetrodoterreno TEXT,acessoaoterreno TEXT,tipopropriedaderural TEXT,areapropriedaderural TEXT,tipoespacopublico TEXT,pavimentacaoespacopublico TEXT,tipoviapublica TEXT,pavimentacaoviapublica TEXT,calcadaviapublica TEXT,logradouropublico TEXT,tipolocalexterno TEXT,descricaolocalexterno TEXT,qtdecadaveres TEXT,regStatus TEXT)');
      });
      var dbpath = await getDatabasesPath();
      print(dbpath);
    }
    return _database;
  }
}
