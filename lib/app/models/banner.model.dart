import 'abstract/from_json.abstract.dart';

class BannerModel extends FromJsonModel {
  String? descricao;
  String? imagem;
  String? link;

  BannerModel({
    this.descricao,
    this.imagem,
    this.link,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    imagem = json["imagem"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => BannerModel.fromJson(json);
}
