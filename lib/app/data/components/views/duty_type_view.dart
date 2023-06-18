import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/concrete/duty_type.dart';
import '../controllers/duty_type_controller.dart';

class DutyTypeView extends GetView<DutyTypeController> {
  const DutyTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.1.sh,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 0.4.sw,
              height: 0.06.sh,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: DropdownButtonHideUnderline(
                child: Obx(() => DropdownButton<DutyType>(
                      items: getDutyTypeItems,
                      onChanged: controller.changeDutyTypeItem,
                      value: controller.currentDutyType,
                      style: Theme.of(context).textTheme.bodyMedium,
                      dropdownColor: Colors.white,
                      alignment: Alignment.center,
                    )),
              ),
            ),
            SizedBox(
              width: 0.4.sw,
              height: 0.06.sh,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: Text('Görev Türü Ekle', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<DutyType>> get getDutyTypeItems {
    final items = <DropdownMenuItem<DutyType>>[];

    for (DutyType dutyType in controller.dutyTypeList) {
      DropdownMenuItem<DutyType> item = DropdownMenuItem<DutyType>(
        value: dutyType,
        child: Dismissible(
          key: UniqueKey(),
          child: Text(
            dutyType.name,
            style: Theme.of(Get.context!).textTheme.bodyMedium,
          ),
        ),
      );

      items.add(item);
    }

    return items;
  }
}
