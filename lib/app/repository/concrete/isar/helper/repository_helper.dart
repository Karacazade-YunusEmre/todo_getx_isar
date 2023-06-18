import 'package:isar/isar.dart';

import '../../../../core/result/abstract/i_result.dart';
import '../../../../core/result/concrete/success_result.dart';
import '../../../../data/mixins/utilities_mixin.dart';
import '../../../../model/concrete/duty.dart';
import '../../../../model/concrete/duty_type.dart';

class RepositoryHelper with UtilitiesMixin {
  RepositoryHelper._();

  static RepositoryHelper? helper;

  static Isar? isar;

  RepositoryHelper() {
    helper ??= RepositoryHelper();
  }

  Future<Isar> getRepositoryInstance() async {
    final repositoryPath = await getSupportDirectoryPath();

    isar ??= await Isar.open(
      [DutySchema, DutyTypeSchema],
      name: 'Repository',
      directory: repositoryPath,
    );

    return isar!;
  }

  Future<IResult> closeRepository({required deleteOption}) async {
    if (isar == null || !isar!.isOpen) {
      return SuccessResult();
    }

    await isar!.close(deleteFromDisk: false).whenComplete(() => isar = null);
    return SuccessResult();
  }

  Future<IResult> backupDatabase({required String targetPath}) async {
    isar = await getRepositoryInstance();

    await isar!.copyToFile(targetPath);
    return SuccessResult();
  }
}
