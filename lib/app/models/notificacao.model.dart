import 'package:laserfast_app/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class NotificacaoModel extends FromJsonModel {
  int? codigo;
  int? codigoCliente;
  int? codigoNotificacao;
  String? tituloNotificacao;
  String? mensagemNotificacao;
  bool? lido;
  DateTime? dataEnvio;

  NotificacaoModel({
    this.codigo,
    this.codigoCliente,
    this.codigoNotificacao,
    this.tituloNotificacao,
    this.mensagemNotificacao,
    this.lido,
    this.dataEnvio,
  });

  NotificacaoModel.createNew(NotificacaoModel model) {
    codigo = model.codigo;
    codigoCliente = model.codigoCliente;
    codigoNotificacao = model.codigoNotificacao;
    tituloNotificacao = model.tituloNotificacao;
    mensagemNotificacao = model.mensagemNotificacao;
    lido = model.lido;
    dataEnvio = model.dataEnvio;
  }

  NotificacaoModel.fromJson(Map<String, dynamic> json) {
    codigo = convertInt(json["codigo"]);
    codigoCliente = convertInt(json["codigoCliente"]);
    codigoNotificacao = convertInt(json["codigoNotificacao"]);
    tituloNotificacao = json["tituloNotificacao"];
    mensagemNotificacao = json["mensagemNotificacao"];
    lido = convertBool(json["lido"], returnNull: false);
    dataEnvio = convertDateTime(json["dataEnvio"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => NotificacaoModel.fromJson(json);
}
