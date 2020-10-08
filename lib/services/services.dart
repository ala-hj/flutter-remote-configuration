import 'package:get/state_manager.dart';
import 'package:remote_application/repository/configuration_repository.dart';

/// Here is where you put get_storage, hive, shared_pref initialization or any async function that requeires to be called before the widgets draw
Future initServices() async {
  print('starting services ...');

  Get.put(() => ConfigRepository().init());

  // await Get.putAsync(() => BookRepostiory().init());
  // await Get.putAsync(() => MovieRepostiory().init());
  print('All services started...');
}
