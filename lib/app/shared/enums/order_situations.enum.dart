// ignore_for_file: constant_identifier_names

enum OrderSituation {
  WAITING,
  ACCEPTED,
  CANCELLED,
  TAKEOUT,
  DELIVERING,
  FINISHED,
  WAITING_PAYMENT,
  PAID,
  REJECTED,
  AUTHORIZED_PAYMENT,
  EXPIRED
}

extension OrderSituationExtension on OrderSituation {
  String? get asString {
    return name.toString();
  }
}
