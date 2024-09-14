import 'abstract/from_json.abstract.dart';

class ParceiroModel extends FromJsonModel {
  String? descricao;
  String? imagem;
  String? link;

  ParceiroModel({
    this.descricao,
    this.imagem,
    this.link,
  });

  ParceiroModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    imagem = json["imagem"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => ParceiroModel.fromJson(json);
}
