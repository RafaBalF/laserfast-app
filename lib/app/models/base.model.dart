import 'package:compregados_app_v2/app/models/abstract/from_json.abstract.dart';
import 'package:compregados_app_v2/app/shared/convert.dart';

class BaseModel<T extends FromJsonModel> {
  bool status = false;
  String message = "Erro ao tentar executar essa ação";
  T? result;
  List<T>? list;
  int? total;
  BaseModel();

  BaseModel.errorMessage(this.message) {
    status = false;
  }

  BaseModel.networkError() {
    status = false;
    message = "Erro de conexão";
  }

  BaseModel.fromJson(Map<String, dynamic> json, {T? tipo}) {
    status = json['status'];
    total = convertInt(json['total']);
    if (json['message'] != null) {
      message = json['message'];
    }
    if (tipo != null && json['result'] != null) {
      var a = tipo.fromJson(json['result']);
      result = a;
    }
    if (tipo != null && json['list'] != null) {
      var l = json['list'] as List<dynamic>;
      list = <T>[];
      for (var element in l) {
        if (element != null) {
          list!.add(tipo.fromJson(element));
        }
      }
    }
  }
}
