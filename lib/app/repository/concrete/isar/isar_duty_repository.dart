import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../core/result/abstract/i_data_result.dart';
import '../../../core/result/abstract/i_result.dart';
import '../../../core/result/concrete/error_data_result.dart';
import '../../../core/result/concrete/error_result.dart';
import '../../../core/result/concrete/success_data_result.dart';
import '../../../core/result/concrete/success_result.dart';
import '../../../model/concrete/duty.dart';
import '../../abstract/i_duty_repository.dart';
import 'helper/repository_helper.dart';

class IsarDutyRepository implements IDutyRepository {
  late RepositoryHelper helper;

  IsarDutyRepository() {
    helper = Get.find();
  }

  @override
  Future<IDataResult<Duty>> add(Duty item) async {
    Isar isar = await helper.getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        final id = await isar.dutys.put(item);
        await item.type.save();
        item.id = id;
      });

      return SuccessDataResult<Duty>(data: item);
    } catch (_) {
      return ErrorDataResult<Duty>();
    }
  }

  @override
  Future<IResult> delete(Duty item) async {
    Isar isar = await helper.getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        await isar.dutys.delete(item.id);
      });

      return SuccessResult();
    } catch (_) {
      return ErrorResult();
    }
  }

  @override
  Future<IDataResult<List<Duty>?>> getAll() async {
    Isar isar = await helper.getRepositoryInstance();

    try {
      final dutyList = await isar.dutys.where().findAll();

      return SuccessDataResult<List<Duty>?>(data: dutyList);
    } catch (_) {
      return ErrorDataResult<List<Duty>?>();
    }
  }

  @override
  Future<IResult> update(Duty item) async {
    Isar isar = await helper.getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        await isar.dutys.put(item);
        await item.type.save();
      });

      return SuccessResult();
    } catch (_) {
      return ErrorResult();
    }
  }
}
