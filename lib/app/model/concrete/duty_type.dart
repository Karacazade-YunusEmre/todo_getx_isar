import 'package:isar/isar.dart';

import '../abstract/i_duty_type.dart';

part 'model_g/duty_type.g.dart';

@collection
class DutyType implements IDutyType {
  Id id = Isar.autoIncrement;
  String name;

  /// for write to the database
  DutyType({required this.name});

  /// for read from the database
  DutyType.read({required this.id, required this.name});
}
