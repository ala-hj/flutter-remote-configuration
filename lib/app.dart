import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:remote_application/binding/initial_bindings.dart';
import 'package:get/get.dart';

import 'package:remote_application/shared/log/logger_utils.dart';

import 'Route/app_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    );
  }
}
