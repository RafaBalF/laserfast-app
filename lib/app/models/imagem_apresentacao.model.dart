import 'abstract/from_json.abstract.dart';

class ImagemApresentacaoModel extends FromJsonModel {
  String? descricao;
  String? imagem;
  double? link;

  ImagemApresentacaoModel({
    this.descricao,
    this.imagem,
    this.link,
  });

  ImagemApresentacaoModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    imagem = json["imagem"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => ImagemApresentacaoModel.fromJson(json);
}
