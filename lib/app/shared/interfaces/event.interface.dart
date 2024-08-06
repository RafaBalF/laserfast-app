import 'package:laserfast_app/app/shared/enums/event_names.enum.dart';

class Event<T> {
  EventNames name;
  T value;

  Event({
    required this.name,
    required this.value,
  });
}
