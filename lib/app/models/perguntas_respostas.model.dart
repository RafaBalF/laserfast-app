import 'abstract/from_json.abstract.dart';

class PerguntasRespostasModel extends FromJsonModel {
  String? descricao;
  String? pergunta;
  String? resposta;

  PerguntasRespostasModel({
    this.descricao,
    this.pergunta,
    this.resposta,
  });

  PerguntasRespostasModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    pergunta = json["pergunta"];
    resposta = json["resposta"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => PerguntasRespostasModel.fromJson(json);
}
