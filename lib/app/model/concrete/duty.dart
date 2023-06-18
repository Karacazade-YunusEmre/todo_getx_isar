import 'package:isar/isar.dart';

import '../abstract/i_duty.dart';
import 'duty_type.dart';

part 'model_g/duty.g.dart';

@collection
class Duty implements IDuty {
  Id id = Isar.autoIncrement;
  String name;

  final type = IsarLink<DutyType>();
  bool isCompleted;

  /// write to the database
  Duty({required this.name, required this.isCompleted});

  /// read from the database
  Duty.read({required this.id, required this.name, required this.isCompleted});
}
