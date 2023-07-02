import 'package:get/get.dart';

import '../../repository/abstract/i_duty_repository.dart';
import '../../repository/abstract/i_duty_type_repository.dart';
import '../../repository/concrete/isar/helper/repository_helper.dart';
import '../../repository/concrete/isar/isar_duty_repository.dart';
import '../../repository/concrete/isar/isar_duty_type_repository.dart';

class RepositoryService extends GetxService {
  @override
  void onInit() {
    super.onInit();

    Get.lazyPut<IDutyRepository>(() => IsarDutyRepository());
    Get.lazyPut<IDutyTypeRepository>(() => IsarDutyTypeRepository());
    Get.lazyPut<RepositoryHelper>(() => RepositoryHelper());
  }
}
