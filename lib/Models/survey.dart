class Survey {
  String id;
  String datahora_inicio;
  String datahora_fim;
  String sobre_novo_posicionamento;
  String evento_de_lancamento;
  String melhorar_suas_operacoes;
  String regStatus;

  Survey({
    this.id = '',
    this.datahora_inicio = '',
    this.datahora_fim = '',
    this.sobre_novo_posicionamento = '',
    this.evento_de_lancamento = '',
    this.melhorar_suas_operacoes = '',
    this.regStatus = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'datahora_inicio': datahora_inicio,
      'datahora_fim': datahora_fim,
      'sobre_novo_posicionamento': sobre_novo_posicionamento,
      'evento_de_lancamento': evento_de_lancamento,
      'melhorar_suas_operacoes': melhorar_suas_operacoes,
      'regStatus': regStatus
    };
  }

  Survey.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.datahora_inicio = obj['datahora_inicio'];
    this.datahora_fim = obj['datahora_fim'];
    this.sobre_novo_posicionamento = obj['sobre_novo_posicionamento'];
    this.evento_de_lancamento = obj['evento_de_lancamento'];
    this.melhorar_suas_operacoes = obj['melhorar_suas_operacoes'];
    this.regStatus = obj['regStatus'];
  }
}
