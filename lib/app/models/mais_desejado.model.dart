import 'package:laserfast_app/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class MaisDesejadoModel extends FromJsonModel {
  String? descricao;
  String? imagem;
  String? link;
  double? de;
  double? por;

  MaisDesejadoModel({
    this.descricao,
    this.imagem,
    this.link,
    this.de,
    this.por,
  });

  MaisDesejadoModel.fromJson(Map<String, dynamic> json) {
    descricao = json["descricao"];
    imagem = json["imagem"];
    link = json["link"];
    de = convertDouble(json["de"]);
    por = convertDouble(json["por"]);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};

  @override
  fromJson(Map<String, dynamic> json) => MaisDesejadoModel.fromJson(json);
}
