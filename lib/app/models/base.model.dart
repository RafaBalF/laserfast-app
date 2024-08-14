import 'package:laserfast_app/app/models/abstract/from_json.abstract.dart';
import 'package:laserfast_app/app/shared/convert.dart';

class BaseModel<T extends FromJsonModel> {
  bool status = false;
  int? statusCode;
  String message = "Erro ao tentar executar essa ação";
  T? data;
  List<T>? list;

  BaseModel();

  BaseModel.errorMessage(this.message) {
    status = false;
  }

  BaseModel.networkError() {
    status = false;
    message = "Erro de conexão";
  }

  BaseModel.fromJson(
    Map<String, dynamic> json, {
    T? tipo,
    bool isList = false,
  }) {
    status = json['success'];

    statusCode = convertInt(json['statusCode']);

    if (json['message'] != null) {
      message = json['message'];
    }

    if (isList) {
      if (tipo != null && json['list'] != null) {
        var l = json['list'] as List<dynamic>;
        list = <T>[];
        for (var element in l) {
          if (element != null) {
            list!.add(tipo.fromJson(element));
          }
        }
      }
    } else {
      if (tipo != null && json['data'] != null) {
        var a = tipo.fromJson(json['data']);
        data = a;
      }
    }
  }
}
