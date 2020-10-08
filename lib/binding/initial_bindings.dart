import 'package:get/instance_manager.dart';

import 'package:remote_application/controller/initial_controller.dart';
import 'package:remote_application/repository/book_repository.dart';
import 'package:remote_application/repository/configuration_repository.dart';
import 'package:remote_application/repository/movie_repository.dart';
import 'package:remote_application/services/API/API.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(API(), permanent: true);
    Get.put(ConfigRepository(), permanent: true);
    Get.put(MovieRepostiory(
      api: Get.find<API>(),
    ));
    Get.put(BookRepostiory(api: Get.find<API>()));

    Get.put(InitialController(
        movieRepostiory: Get.find<MovieRepostiory>(),
        bookRepostiory: Get.find<BookRepostiory>(),
        configRepository: Get.find<ConfigRepository>()));
  }
}
