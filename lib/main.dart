import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/data/getx_services/reposiory_service.dart';
import 'app/data/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  initializeApp();
  runApp(getMaterialApp());
}

void initializeApp() {
  setupServices();
}

void setupServices() {
  Get.put<RepositoryService>(RepositoryService()).onInit();
}

Widget getMaterialApp() {
  return ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDos',
        theme: AppTheme.getAppTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  );
}
