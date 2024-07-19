// ignore_for_file: constant_identifier_names

enum NotificationPayloadType {
  CHAT,
}

extension NotificationPayloadTypeExtension on NotificationPayloadType {
  String? get asString {
    return name.toString();
  }
}
