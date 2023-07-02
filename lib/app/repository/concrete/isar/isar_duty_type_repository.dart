import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../../core/result/abstract/i_data_result.dart';
import '../../../core/result/abstract/i_result.dart';
import '../../../core/result/concrete/error_data_result.dart';
import '../../../core/result/concrete/error_result.dart';
import '../../../core/result/concrete/success_data_result.dart';
import '../../../core/result/concrete/success_result.dart';
import '../../../model/concrete/duty_type.dart';
import '../../abstract/i_duty_type_repository.dart';
import 'helper/repository_helper.dart';

class IsarDutyTypeRepository implements IDutyTypeRepository {
  late RepositoryHelper helper;

  IsarDutyTypeRepository() {
    helper = Get.find();
  }

  @override
  Future<IDataResult<DutyType>> add(DutyType item) async {
    Isar isar = await RepositoryHelper().getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        final id = await isar.dutyTypes.put(item);
        item.id = id;
      });

      return SuccessDataResult<DutyType>();
    } catch (_) {
      return ErrorDataResult<DutyType>();
    }
  }

  @override
  Future<IResult> delete(DutyType item) async {
    Isar isar = await RepositoryHelper().getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        await isar.dutyTypes.delete(item.id);
      });

      return ErrorResult();
    } catch (_) {
      return ErrorResult();
    }
  }

  @override
  Future<IDataResult<List<DutyType>?>> getAll() async {
    Isar isar = await RepositoryHelper().getRepositoryInstance();

    try {
      final dutyTypes = await isar.dutyTypes.where().findAll();

      return SuccessDataResult<List<DutyType>?>(data: dutyTypes);
    } catch (_) {
      return ErrorDataResult<List<DutyType>?>();
    }
  }

  @override
  Future<IResult> update(DutyType item) async {
    Isar isar = await RepositoryHelper().getRepositoryInstance();

    try {
      await isar.writeTxn(() async {
        await isar.dutyTypes.put(item);
      });

      return SuccessResult();
    } catch (_) {
      return ErrorResult();
    }
  }
}
