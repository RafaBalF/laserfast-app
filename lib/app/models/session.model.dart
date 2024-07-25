import 'abstract/from_json.abstract.dart';

class SessionModel extends FromJsonModel {
  String? status;
  String? areas;
  String? applicator;
  DateTime? date;
  int? statusCode;

  // 0 => realizada
  // 1 => falta
  // 2 => agendada
  // 3 => em andamento
  // 4 => confirmada

  SessionModel({
    this.status,
    this.areas,
    this.applicator,
    this.date,
    this.statusCode,
  });

  SessionModel.createNew(SessionModel model) {
    status = model.status;
    areas = model.areas;
    applicator = model.applicator;
    date = model.date;
    statusCode = model.statusCode;
  }

  SessionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    areas = json['areas'];
    applicator = json['applicator'];
    date = json['date'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => SessionModel.fromJson(json);
}
