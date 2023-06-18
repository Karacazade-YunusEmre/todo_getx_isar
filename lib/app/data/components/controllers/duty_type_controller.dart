import 'package:get/get.dart';

import '../../../model/concrete/duty_type.dart';

class DutyTypeController extends GetxController {
  final dutyTypeList = RxList<DutyType>();
  final _currentDutyType = Rxn<DutyType>();

  @override
  void onInit() {
    super.onInit();

    loadDutyTypeList();
    setupCurrentDutyType();
  }

  ///region GetterAndSetter

  ///region CurrentDutyType

  DutyType? get currentDutyType => _currentDutyType.value;

  set currentDutyType(DutyType? value) => _currentDutyType.value = value;

  ///endregion CurrentDutyType

  ///endregion GetterAndSetter

  ///region EventMethods

  ///region LoadDutyTypeList
  void loadDutyTypeList() {
    final dutyTypes = <DutyType>[
      DutyType(name: 'İş Yeri'),
      DutyType(name: 'Ev'),
      DutyType(name: 'Dersane'),
      DutyType(name: 'Okul'),
      DutyType(name: 'Hastane'),
      DutyType(name: 'Dişçi'),
      DutyType(name: 'Araba'),
      DutyType(name: 'Bilgisayar'),
    ];

    dutyTypeList.addAll(dutyTypes);
    dutyTypeList.refresh();
  }

  ///endregion LoadDutyTypeList

  ///region SetupCurrentDutyType
  void setupCurrentDutyType() {
    currentDutyType = dutyTypeList.first;
  }

  ///endregion SetupCurrentDutyType

  ///region ChangeDutyTypeItem
  void changeDutyTypeItem(DutyType? item) {
    currentDutyType = item;
    _currentDutyType.refresh();
  }

  ///endregion ChangeDutyTypeItem

  ///endregion EventMethods
}
