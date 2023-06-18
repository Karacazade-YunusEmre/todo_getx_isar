import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/concrete/duty.dart';

class HomeController extends GetxController {
  final dutyList = RxList<Duty>();
  final _currentTodoText = RxnString();
  final _unCompletedTodosCount = RxInt(0);

  final formKey = GlobalKey<FormState>(debugLabel: 'DutyFormKey');
  late TextEditingController textAddController;
  late TextEditingController textEditController;

  @override
  void onInit() {
    super.onInit();

    initTextControllers();
    loadDutyList();
    checkCompletedTodos();
  }

  @override
  void onClose() {
    disposeTextControllers();

    super.onClose();
  }

  ///region GetterAndSetter

  ///region CurrentTodoText
  String? get currentTodoText => _currentTodoText.value;

  set currentTodoText(String? value) => _currentTodoText.value = value;

  ///endregion CurrentTodoText

  ///region UnCompletedTodosCount

  int get unCompletedTodosCount => _unCompletedTodosCount.value;

  set unCompletedTodosCount(int value) => _unCompletedTodosCount.value = value;

  ///endregion UnCompletedTodosCount

  ///endregion GetterAndSetter

  ///region ValidatorMethods

  ///region TodoValidator
  String? todoValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Görev adı boş bırakılamaz!';
    }
    if (value != null && value.length <= 2) {
      return 'Görev adı 3 karakterden az olamaz!';
    }

    return null;
  }

  ///endregion TodoValidator

  ///endregion ValidatorMethods

  ///region SaveMethods

  void currentTodoOnSaved(String? value) {
    currentTodoText = value;
  }

  ///endregion SaveMethods

  ///region EventMethods

  ///region LoadDutyList
  void loadDutyList() {
    dutyList.addAll([
      Duty(name: 'Birinci', isCompleted: false),
      Duty(name: 'İkinci', isCompleted: false),
      Duty(name: 'Üçüncü', isCompleted: false),
      Duty(name: 'Dördüncü', isCompleted: false),
      Duty(name: 'Beşinci', isCompleted: false),
      Duty(name: 'Altıncı', isCompleted: false),
    ]);
  }

  ///endregion LoadDutyList

  ///region ChangeIsComplete
  void changeDutyComplete(Duty currentDuty, bool? value) {
    if (value != null) {
      currentDuty.isCompleted = value;

      dutyList.refresh();
      checkCompletedTodos();
    }
  }

  ///endregion ChangeIsComplete

  ///region UpdateDuty
  void updateDuty({required String value, required Duty currentDuty}) {
    currentDuty.name = value;
    dutyList.refresh();
  }

  ///endregion UpdateDuty

  ///region AddDuty
  void addDuty() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Duty newDuty = Duty(name: currentTodoText!, isCompleted: false);
      dutyList.add(newDuty);
      dutyList.refresh();

      FocusScope.of(Get.context!).unfocus();
    }
  }

  ///endregion AddDuty

  ///region RemoveDuty
  void removeDuty({required DismissDirection direction, required Duty currentDuty}) {
    dutyList.remove(currentDuty);
    dutyList.refresh();
  }

  ///endregion RemoveDuty

  ///region ClearDutyController
  void clearDutyController() {
    textAddController.clear();
  }

  ///endregion ClearDutyController

  ///endregion EventMethods

  ///region GeneralPurposeMethods

  ///region InitTextControllers
  void initTextControllers() {
    textAddController = TextEditingController();
    textEditController = TextEditingController();
  }

  ///endregion InitTextControllers

  ///region DisposeTextControllers
  void disposeTextControllers() {
    textAddController.dispose();
    textEditController.dispose();
  }

  ///endregion DisposeTextControllers

  ///region CheckCompletedWidgets
  void checkCompletedTodos() {
    unCompletedTodosCount = 0;

    for (Duty duty in dutyList) {
      if (!duty.isCompleted) {
        unCompletedTodosCount++;
      }
    }
  }

  ///endregion CheckCompletedWidgets

  ///endregion GeneralPurposeMethods
}
