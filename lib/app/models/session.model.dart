import 'package:laserfast_app/app/models/session_area.model.dart';

import 'abstract/from_json.abstract.dart';

class SessionModel extends FromJsonModel {
  int? id;
  String? status;
  String? areas;
  String? applicator;
  DateTime? date;
  int? statusCode;
  List<SessionAreaModel>? sessionAreas;

  // 0 => realizada
  // 1 => falta
  // 2 => agendada
  // 3 => em andamento
  // 4 => confirmada

  SessionModel({
    this.id,
    this.status,
    this.areas,
    this.applicator,
    this.date,
    this.statusCode,
    this.sessionAreas,
  });

  SessionModel.createNew(SessionModel model) {
    id = model.id;
    status = model.status;
    areas = model.areas;
    applicator = model.applicator;
    date = model.date;
    statusCode = model.statusCode;
    sessionAreas = model.sessionAreas;
  }

  SessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    areas = json['areas'];
    applicator = json['applicator'];
    date = json['date'];
    statusCode = json['statusCode'];

    if (json['sessionAreas'] != null) {
      sessionAreas = [];
      for (var area in json['sessionAreas']) {
        var m = SessionAreaModel.fromJson(area);
        sessionAreas!.add(m);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => SessionModel.fromJson(json);
}
