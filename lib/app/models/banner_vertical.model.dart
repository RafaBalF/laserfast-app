import 'abstract/from_json.abstract.dart';

class BannerVerticalModel extends FromJsonModel {
  String? descricao;
  String? imagem;
  String? link;

  BannerVerticalModel({
    this.descricao,
    this.imagem,
    this.link,
  });

  BannerVerticalModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    imagem = json["imagem"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => BannerVerticalModel.fromJson(json);
}
