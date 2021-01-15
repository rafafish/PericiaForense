class Pericia {
  String id;
  String datahora_inicio;
  String datahora_fim;
  String latitude;
  String longitude;
  String endereco;
  String descricaoendereco;
  String isolado;
  String guarnecido;
  String preservado;
  String statuslocal;
  String equipeisolamento;
  String preservacaolocal;
  String policialmilitar0;
  String policialmilitar1;
  String policialcivil0;
  String policialcivil1;
  String outrasforcas0;
  String outrasforcas1;
  String tipoid0;
  String tipoid1;
  String numeroid0;
  String numeroid1;
  String relator0;
  String relator1;
  String tipoexame;
  String tipolocal;
  String nomecadaver;
  String tipodocumentocadaver;
  String numerodocumentocadaver;
  String idadecadaver;
  String sexocadaver;
  String ocupacao;
  String racacadaver;
  String compleicaocadaver;
  String cabeloscadaver;
  String cordoscabeloscadaver;
  String comprimentodoscabeloscadaver;
  String pelosfaciaiscadaver;
  String tipotatuagemcadaver;
  String localizacaotatuagemcadaver;
  String descricaocicatrizcadaver;
  String localizacaocicatrizcadaver;
  String tipopiercingcadaver;
  String localizacaopiercingcadaver;
  String outrotipodemarcapessoal;
  String vestescadaver;
  String roupasintimascadaver;
  String aderecosadornoscadaver;
  String sapatoscadaver;
  String posicionamentodocadaver;
  String posicaomembrosuperiordireito;
  String posicaomembrosuperioresquerdo;
  String posicaomembroinferiordireito;
  String posicaomembroinferioresquerdo;
  String rigidezcadaverica;
  String livoresdehipostase;
  String situacaodocadaver;
  String tipoarmadefogo;
  String marcaarmadefogo;
  String numerodeseriearmadefogo;
  String calibrearmadefogo;
  String carregadaarmadefogo;
  String descricaocomplementararmadefogo;
  String tipocartucho;
  String calibrecartucho;
  String fabricantecartucho;
  String numeracaoderastreiocartucho;
  String descricaocomplementarcartucho;
  String tipoestojo;
  String calibreestojo;
  String fabricanteestojo;
  String numeracaoderastreioestojo;
  String descricaocomplementarestojo;
  String tipoprojetil;
  String calibreprojetil;
  String descricaocomplementarprojetil;
  String tiponucleo;
  String calibrenucleo;
  String descricaocomplementarnucleo;
  String tipocamisa;
  String calibrecamisa;
  String descricaocomplementarcamisa;
  String coletadatiloscopica;
  String coletapalmar;
  String coletaplantar;
  String coletadna;
  String coletasangue;
  String coletasemem;
  String coletapelos;
  String outrosvestigiosbiologicos;
  String manchasdesangue;
  String posicaodono;
  String tipodeno;
  String drogasemedicamentos;
  String outrosvestigios;
  String anotacoescomplementares;
  String hipotesepreliminar;
  String tipificacaopreliminar;
  String assinaturadoperito;
  String tipificacaopreliminarhomicidio;
  String tipificacaopreliminarmorteacidental;
  String tipificacaopreliminarsuicidio;
  String manchadesanguepassivatransferencia;
  String manchadesanguepassivapadraogota;
  String manchadesanguepassiva;
  String manchadesanguesalpico;
  String manchadesanguealteradas;
  String fasedeputrefacao;
  String tipolocalinterno;
  String estruturadeedificacao;
  String vedacaoexternadaedificacao;
  String compartimentacaointerna;
  String estruturadacobertura;
  String cobertura;
  String forro;
  String piso;
  String esquadriasexternas;
  String esquadriasinternas;
  String fechamentodoperimetrodoterreno;
  String acessoaoterreno;
  String tipopropriedaderural;
  String areapropriedaderural;
  String tipoespacopublico;
  String pavimentacaoespacopublico;
  String tipoviapublica;
  String pavimentacaoviapublica;
  String calcadaviapublica;
  String logradouropublico;
  String tipolocalexterno;
  String descricaolocalexterno;
  String qtdecadaveres;
  String regStatus;

  Pericia(
      {this.id = '',
      this.datahora_inicio = '',
      this.datahora_fim = '',
      this.latitude = '',
      this.longitude = '',
      this.endereco = '',
      this.descricaoendereco = '',
      this.isolado = '',
      this.guarnecido = '',
      this.preservado = '',
      this.statuslocal = '',
      this.equipeisolamento = '',
      this.preservacaolocal = '',
      this.policialmilitar0 = '',
      this.policialmilitar1 = '',
      this.policialcivil0 = '',
      this.policialcivil1 = '',
      this.outrasforcas0 = '',
      this.outrasforcas1 = '',
      this.tipoid0 = '',
      this.tipoid1 = '',
      this.numeroid0 = '',
      this.numeroid1 = '',
      this.relator0 = '',
      this.relator1 = '',
      this.tipoexame = '',
      this.tipolocal = '',
      this.nomecadaver = '',
      this.tipodocumentocadaver = '',
      this.numerodocumentocadaver = '',
      this.idadecadaver = '',
      this.sexocadaver = '',
      this.ocupacao = '',
      this.racacadaver = '',
      this.compleicaocadaver = '',
      this.cabeloscadaver = '',
      this.cordoscabeloscadaver = '',
      this.comprimentodoscabeloscadaver = '',
      this.pelosfaciaiscadaver = '',
      this.tipotatuagemcadaver = '',
      this.localizacaotatuagemcadaver = '',
      this.descricaocicatrizcadaver = '',
      this.localizacaocicatrizcadaver = '',
      this.tipopiercingcadaver = '',
      this.localizacaopiercingcadaver = '',
      this.outrotipodemarcapessoal = '',
      this.vestescadaver = '',
      this.roupasintimascadaver = '',
      this.aderecosadornoscadaver = '',
      this.sapatoscadaver = '',
      this.posicionamentodocadaver = '',
      this.posicaomembrosuperiordireito = '',
      this.posicaomembrosuperioresquerdo = '',
      this.posicaomembroinferiordireito = '',
      this.posicaomembroinferioresquerdo = '',
      this.rigidezcadaverica = '',
      this.livoresdehipostase = '',
      this.situacaodocadaver = '',
      this.tipoarmadefogo = '',
      this.marcaarmadefogo = '',
      this.numerodeseriearmadefogo = '',
      this.calibrearmadefogo = '',
      this.carregadaarmadefogo = '',
      this.descricaocomplementararmadefogo = '',
      this.tipocartucho = '',
      this.calibrecartucho = '',
      this.fabricantecartucho = '',
      this.numeracaoderastreiocartucho = '',
      this.descricaocomplementarcartucho = '',
      this.tipoestojo = '',
      this.calibreestojo = '',
      this.fabricanteestojo = '',
      this.numeracaoderastreioestojo = '',
      this.descricaocomplementarestojo = '',
      this.tipoprojetil = '',
      this.calibreprojetil = '',
      this.descricaocomplementarprojetil = '',
      this.tiponucleo = '',
      this.calibrenucleo = '',
      this.descricaocomplementarnucleo = '',
      this.tipocamisa = '',
      this.calibrecamisa = '',
      this.descricaocomplementarcamisa = '',
      this.coletadatiloscopica = '',
      this.coletapalmar = '',
      this.coletaplantar = '',
      this.coletadna = '',
      this.coletasangue = '',
      this.coletasemem = '',
      this.coletapelos = '',
      this.outrosvestigiosbiologicos = '',
      this.manchasdesangue = '',
      this.posicaodono = '',
      this.tipodeno = '',
      this.drogasemedicamentos = '',
      this.outrosvestigios = '',
      this.anotacoescomplementares = '',
      this.hipotesepreliminar = '',
      this.tipificacaopreliminar = '',
      this.assinaturadoperito = '',
      this.tipificacaopreliminarhomicidio = '',
      this.tipificacaopreliminarmorteacidental = '',
      this.tipificacaopreliminarsuicidio = '',
      this.manchadesanguepassivatransferencia = '',
      this.manchadesanguepassivapadraogota = '',
      this.manchadesanguepassiva = '',
      this.manchadesanguesalpico = '',
      this.manchadesanguealteradas = '',
      this.fasedeputrefacao = '',
      this.tipolocalinterno = '',
      this.estruturadeedificacao = '',
      this.vedacaoexternadaedificacao = '',
      this.compartimentacaointerna = '',
      this.estruturadacobertura = '',
      this.cobertura = '',
      this.forro = '',
      this.piso = '',
      this.esquadriasexternas = '',
      this.esquadriasinternas = '',
      this.fechamentodoperimetrodoterreno = '',
      this.acessoaoterreno = '',
      this.tipopropriedaderural = '',
      this.areapropriedaderural = '',
      this.tipoespacopublico = '',
      this.pavimentacaoespacopublico = '',
      this.tipoviapublica = '',
      this.pavimentacaoviapublica = '',
      this.calcadaviapublica = '',
      this.logradouropublico = '',
      this.tipolocalexterno = '',
      this.descricaolocalexterno = '',
      this.qtdecadaveres = '',
      this.regStatus = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'datahora_inicio': datahora_inicio ?? '',
      'datahora_fim': datahora_fim ?? '',
      'latitude': latitude ?? '',
      'longitude': longitude ?? '',
      'endereco': endereco ?? '',
      'descricaoendereco': descricaoendereco ?? '',
      'isolado': isolado ?? '',
      'guarnecido': guarnecido ?? '',
      'preservado': preservado ?? '',
      'statuslocal': statuslocal ?? '',
      'equipeisolamento': equipeisolamento ?? '',
      'preservacaolocal': preservacaolocal ?? '',
      'policialmilitar0': policialmilitar0 ?? '',
      'policialmilitar1': policialmilitar1 ?? '',
      'policialcivil0': policialcivil0 ?? '',
      'policialcivil1': policialcivil1 ?? '',
      'outrasforcas0': outrasforcas0 ?? '',
      'outrasforcas1': outrasforcas1 ?? '',
      'tipoid0': tipoid0 ?? '',
      'tipoid1': tipoid1 ?? '',
      'numeroid0': numeroid0 ?? '',
      'numeroid1': numeroid1 ?? '',
      'relator0': relator0 ?? '',
      'relator1': relator1 ?? '',
      'tipoexame': tipoexame ?? '',
      'tipolocal': tipolocal ?? '',
      'nomecadaver': nomecadaver ?? '',
      'tipodocumentocadaver': tipodocumentocadaver ?? '',
      'numerodocumentocadaver': numerodocumentocadaver ?? '',
      'idadecadaver': idadecadaver ?? '',
      'sexocadaver': sexocadaver ?? '',
      'ocupacao': ocupacao ?? '',
      'racacadaver': racacadaver ?? '',
      'compleicaocadaver': compleicaocadaver ?? '',
      'cabeloscadaver': cabeloscadaver ?? '',
      'cordoscabeloscadaver': cordoscabeloscadaver ?? '',
      'comprimentodoscabeloscadaver': comprimentodoscabeloscadaver ?? '',
      'pelosfaciaiscadaver': pelosfaciaiscadaver ?? '',
      'tipotatuagemcadaver': tipotatuagemcadaver ?? '',
      'localizacaotatuagemcadaver': localizacaotatuagemcadaver ?? '',
      'descricaocicatrizcadaver': descricaocicatrizcadaver ?? '',
      'localizacaocicatrizcadaver': localizacaocicatrizcadaver ?? '',
      'tipopiercingcadaver': tipopiercingcadaver ?? '',
      'localizacaopiercingcadaver': localizacaopiercingcadaver ?? '',
      'outrotipodemarcapessoal': outrotipodemarcapessoal ?? '',
      'vestescadaver': vestescadaver ?? '',
      'roupasintimascadaver': roupasintimascadaver ?? '',
      'aderecosadornoscadaver': aderecosadornoscadaver ?? '',
      'sapatoscadaver': sapatoscadaver ?? '',
      'posicionamentodocadaver': posicionamentodocadaver ?? '',
      'posicaomembrosuperiordireito': posicaomembrosuperiordireito ?? '',
      'posicaomembrosuperioresquerdo': posicaomembrosuperioresquerdo ?? '',
      'posicaomembroinferiordireito': posicaomembroinferiordireito ?? '',
      'posicaomembroinferioresquerdo': posicaomembroinferioresquerdo ?? '',
      'rigidezcadaverica': rigidezcadaverica ?? '',
      'livoresdehipostase': livoresdehipostase ?? '',
      'situacaodocadaver': situacaodocadaver ?? '',
      'tipoarmadefogo': tipoarmadefogo ?? '',
      'marcaarmadefogo': marcaarmadefogo ?? '',
      'numerodeseriearmadefogo': numerodeseriearmadefogo ?? '',
      'calibrearmadefogo': calibrearmadefogo ?? '',
      'carregadaarmadefogo': carregadaarmadefogo ?? '',
      'descricaocomplementararmadefogo': descricaocomplementararmadefogo ?? '',
      'tipocartucho': tipocartucho ?? '',
      'calibrecartucho': calibrecartucho ?? '',
      'fabricantecartucho': fabricantecartucho ?? '',
      'numeracaoderastreiocartucho': numeracaoderastreiocartucho ?? '',
      'descricaocomplementarcartucho': descricaocomplementarcartucho ?? '',
      'tipoestojo': tipoestojo ?? '',
      'calibreestojo': calibreestojo ?? '',
      'fabricanteestojo': fabricanteestojo ?? '',
      'numeracaoderastreioestojo': numeracaoderastreioestojo ?? '',
      'descricaocomplementarestojo': descricaocomplementarestojo ?? '',
      'tipoprojetil': tipoprojetil ?? '',
      'calibreprojetil': calibreprojetil ?? '',
      'descricaocomplementarprojetil': descricaocomplementarprojetil ?? '',
      'tiponucleo': tiponucleo ?? '',
      'calibrenucleo': calibrenucleo ?? '',
      'descricaocomplementarnucleo': descricaocomplementarnucleo ?? '',
      'tipocamisa': tipocamisa ?? '',
      'calibrecamisa': calibrecamisa ?? '',
      'descricaocomplementarcamisa': descricaocomplementarcamisa ?? '',
      'coletadatiloscopica': coletadatiloscopica ?? '',
      'coletapalmar': coletapalmar ?? '',
      'coletaplantar': coletaplantar ?? '',
      'coletadna': coletadna ?? '',
      'coletasangue': coletasangue ?? '',
      'coletasemem': coletasemem ?? '',
      'coletapelos': coletapelos ?? '',
      'outrosvestigiosbiologicos': outrosvestigiosbiologicos ?? '',
      'manchasdesangue': manchasdesangue ?? '',
      'posicaodono': posicaodono ?? '',
      'tipodeno': tipodeno ?? '',
      'drogasemedicamentos': drogasemedicamentos ?? '',
      'outrosvestigios': outrosvestigios ?? '',
      'anotacoescomplementares': anotacoescomplementares ?? '',
      'hipotesepreliminar': hipotesepreliminar ?? '',
      'tipificacaopreliminar': tipificacaopreliminar ?? '',
      'assinaturadoperito': assinaturadoperito ?? '',
      'tipificacaopreliminarhomicidio': tipificacaopreliminarhomicidio ?? '',
      'tipificacaopreliminarmorteacidental':
          tipificacaopreliminarmorteacidental ?? '',
      'tipificacaopreliminarsuicidio': tipificacaopreliminarsuicidio ?? '',
      'manchadesanguepassivatransferencia':
          manchadesanguepassivatransferencia ?? '',
      'manchadesanguepassivapadraogota': manchadesanguepassivapadraogota ?? '',
      'manchadesanguepassiva': manchadesanguepassiva ?? '',
      'manchadesanguesalpico': manchadesanguesalpico ?? '',
      'manchadesanguealteradas': manchadesanguealteradas ?? '',
      'fasedeputrefacao': fasedeputrefacao ?? '',
      'tipolocalinterno': tipolocalinterno ?? '',
      'estruturadeedificacao': estruturadeedificacao ?? '',
      'vedacaoexternadaedificacao': vedacaoexternadaedificacao ?? '',
      'compartimentacaointerna': compartimentacaointerna ?? '',
      'estruturadacobertura': estruturadacobertura ?? '',
      'cobertura': cobertura ?? '',
      'forro': forro ?? '',
      'piso': piso ?? '',
      'esquadriasexternas': esquadriasexternas ?? '',
      'esquadriasinternas': esquadriasinternas ?? '',
      'fechamentodoperimetrodoterreno': fechamentodoperimetrodoterreno ?? '',
      'acessoaoterreno': acessoaoterreno ?? '',
      'tipopropriedaderural': tipopropriedaderural ?? '',
      'areapropriedaderural': areapropriedaderural ?? '',
      'tipoespacopublico': tipoespacopublico ?? '',
      'pavimentacaoespacopublico': pavimentacaoespacopublico ?? '',
      'tipoviapublica': tipoviapublica ?? '',
      'pavimentacaoviapublica': pavimentacaoviapublica ?? '',
      'calcadaviapublica': calcadaviapublica ?? '',
      'logradouropublico': logradouropublico ?? '',
      'tipolocalexterno': tipolocalexterno ?? '',
      'descricaolocalexterno': descricaolocalexterno ?? '',
      'qtdecadaveres': qtdecadaveres ?? '',
      'regStatus': regStatus ?? ''
    };
  }

  Pericia.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.datahora_inicio = obj['datahora_inicio'];
    this.datahora_fim = obj['datahora_fim'];
    this.latitude = obj['latitude'];
    this.longitude = obj['longitude'];
    this.endereco = obj['endereco'];
    this.descricaoendereco = obj['descricaoendereco'];
    this.isolado = obj['isolado'];
    this.guarnecido = obj['guarnecido'];
    this.preservado = obj['preservado'];
    this.statuslocal = obj['statuslocal'];
    this.equipeisolamento = obj['equipeisolamento'];
    this.preservacaolocal = obj['preservacaolocal'];
    this.policialmilitar0 = obj['policialmilitar0'];
    this.policialmilitar1 = obj['policialmilitar1'];
    this.policialcivil0 = obj['policialcivil0'];
    this.policialcivil1 = obj['policialcivil1'];
    this.outrasforcas0 = obj['outrasforcas0'];
    this.outrasforcas1 = obj['outrasforcas1'];
    this.tipoid0 = obj['tipoid0'];
    this.tipoid1 = obj['tipoid1'];
    this.numeroid0 = obj['numeroid0'];
    this.numeroid1 = obj['numeroid1'];
    this.relator0 = obj['relator0'];
    this.relator1 = obj['relator1'];
    this.tipoexame = obj['tipoexame'];
    this.tipolocal = obj['tipolocal'];
    this.nomecadaver = obj['nomecadaver'];
    this.tipodocumentocadaver = obj['tipodocumentocadaver'];
    this.numerodocumentocadaver = obj['numerodocumentocadaver'];
    this.idadecadaver = obj['idadecadaver'];
    this.sexocadaver = obj['sexocadaver'];
    this.ocupacao = obj['ocupacao'];
    this.racacadaver = obj['racacadaver'];
    this.compleicaocadaver = obj['compleicaocadaver'];
    this.cabeloscadaver = obj['cabeloscadaver'];
    this.cordoscabeloscadaver = obj['cordoscabeloscadaver'];
    this.comprimentodoscabeloscadaver = obj['comprimentodoscabeloscadaver'];
    this.pelosfaciaiscadaver = obj['pelosfaciaiscadaver'];
    this.tipotatuagemcadaver = obj['tipotatuagemcadaver'];
    this.localizacaotatuagemcadaver = obj['localizacaotatuagemcadaver'];
    this.descricaocicatrizcadaver = obj['descricaocicatrizcadaver'];
    this.localizacaocicatrizcadaver = obj['localizacaocicatrizcadaver'];
    this.tipopiercingcadaver = obj['tipopiercingcadaver'];
    this.localizacaopiercingcadaver = obj['localizacaopiercingcadaver'];
    this.outrotipodemarcapessoal = obj['outrotipodemarcapessoal'];
    this.vestescadaver = obj['vestescadaver'];
    this.roupasintimascadaver = obj['roupasintimascadaver'];
    this.aderecosadornoscadaver = obj['aderecosadornoscadaver'];
    this.sapatoscadaver = obj['sapatoscadaver'];
    this.posicionamentodocadaver = obj['posicionamentodocadaver'];
    this.posicaomembrosuperiordireito = obj['posicaomembrosuperiordireito'];
    this.posicaomembrosuperioresquerdo = obj['posicaomembrosuperioresquerdo'];
    this.posicaomembroinferiordireito = obj['posicaomembroinferiordireito'];
    this.posicaomembroinferioresquerdo = obj['posicaomembroinferioresquerdo'];
    this.rigidezcadaverica = obj['rigidezcadaverica'];
    this.livoresdehipostase = obj['livoresdehipostase'];
    this.situacaodocadaver = obj['situacaodocadaver'];
    this.tipoarmadefogo = obj['tipoarmadefogo'];
    this.marcaarmadefogo = obj['marcaarmadefogo'];
    this.numerodeseriearmadefogo = obj['numerodeseriearmadefogo'];
    this.calibrearmadefogo = obj['calibrearmadefogo'];
    this.carregadaarmadefogo = obj['carregadaarmadefogo'];
    this.descricaocomplementararmadefogo =
        obj['descricaocomplementararmadefogo'];
    this.tipocartucho = obj['tipocartucho'];
    this.calibrecartucho = obj['calibrecartucho'];
    this.fabricantecartucho = obj['fabricantecartucho'];
    this.numeracaoderastreiocartucho = obj['numeracaoderastreiocartucho'];
    this.descricaocomplementarcartucho = obj['descricaocomplementarcartucho'];
    this.tipoestojo = obj['tipoestojo'];
    this.calibreestojo = obj['calibreestojo'];
    this.fabricanteestojo = obj['fabricanteestojo'];
    this.numeracaoderastreioestojo = obj['numeracaoderastreioestojo'];
    this.descricaocomplementarestojo = obj['descricaocomplementarestojo'];
    this.tipoprojetil = obj['tipoprojetil'];
    this.calibreprojetil = obj['calibreprojetil'];
    this.descricaocomplementarprojetil = obj['descricaocomplementarprojetil'];
    this.tiponucleo = obj['tiponucleo'];
    this.calibrenucleo = obj['calibrenucleo'];
    this.descricaocomplementarnucleo = obj['descricaocomplementarnucleo'];
    this.tipocamisa = obj['tipocamisa'];
    this.calibrecamisa = obj['calibrecamisa'];
    this.descricaocomplementarcamisa = obj['descricaocomplementarcamisa'];
    this.coletadatiloscopica = obj['coletadatiloscopica'];
    this.coletapalmar = obj['coletapalmar'];
    this.coletaplantar = obj['coletaplantar'];
    this.coletadna = obj['coletadna'];
    this.coletasangue = obj['coletasangue'];
    this.coletasemem = obj['coletasemem'];
    this.coletapelos = obj['coletapelos'];
    this.outrosvestigiosbiologicos = obj['outrosvestigiosbiologicos'];
    this.manchasdesangue = obj['manchasdesangue'];
    this.posicaodono = obj['posicaodono'];
    this.tipodeno = obj['tipodeno'];
    this.drogasemedicamentos = obj['drogasemedicamentos'];
    this.outrosvestigios = obj['outrosvestigios'];
    this.anotacoescomplementares = obj['anotacoescomplementares'];
    this.hipotesepreliminar = obj['hipotesepreliminar'];
    this.tipificacaopreliminar = obj['tipificacaopreliminar'];
    this.assinaturadoperito = obj['assinaturadoperito'];
    this.tipificacaopreliminarhomicidio = obj['tipificacaopreliminarhomicidio'];
    this.tipificacaopreliminarmorteacidental =
        obj['tipificacaopreliminarmorteacidental'];
    this.tipificacaopreliminarsuicidio = obj['tipificacaopreliminarsuicidio'];
    this.manchadesanguepassivatransferencia =
        obj['manchadesanguepassivatransferencia'];
    this.manchadesanguepassivapadraogota =
        obj['manchadesanguepassivapadraogota'];
    this.manchadesanguepassiva = obj['manchadesanguepassiva'];
    this.manchadesanguesalpico = obj['manchadesanguesalpico'];
    this.manchadesanguealteradas = obj['manchadesanguealteradas'];
    this.fasedeputrefacao = obj['fasedeputrefacao'];
    this.tipolocalinterno = obj['tipolocalinterno'];
    this.estruturadeedificacao = obj['estruturadeedificacao'];
    this.vedacaoexternadaedificacao = obj['vedacaoexternadaedificacao'];
    this.compartimentacaointerna = obj['compartimentacaointerna'];
    this.estruturadacobertura = obj['estruturadacobertura'];
    this.cobertura = obj['cobertura'];
    this.forro = obj['forro'];
    this.piso = obj['piso'];
    this.esquadriasexternas = obj['esquadriasexternas'];
    this.esquadriasinternas = obj['esquadriasinternas'];
    this.fechamentodoperimetrodoterreno = obj['fechamentodoperimetrodoterreno'];
    this.acessoaoterreno = obj['acessoaoterreno'];
    this.tipopropriedaderural = obj['tipopropriedaderural'];
    this.areapropriedaderural = obj['areapropriedaderural'];
    this.tipoespacopublico = obj['tipoespacopublico'];
    this.pavimentacaoespacopublico = obj['pavimentacaoespacopublico'];
    this.tipoviapublica = obj['tipoviapublica'];
    this.pavimentacaoviapublica = obj['pavimentacaoviapublica'];
    this.calcadaviapublica = obj['calcadaviapublica'];
    this.logradouropublico = obj['logradouropublico'];
    this.tipolocalexterno = obj['tipolocalexterno'];
    this.descricaolocalexterno = obj['descricaolocalexterno'];
    this.qtdecadaveres = obj['qtdecadaveres'];
    this.regStatus = obj['regStatus'];
  }
}
