import 'package:get/get.dart';
import 'package:remote_application/controller/chapters_controller.dart';
import 'package:remote_application/repository/book_repository.dart';
import 'package:remote_application/services/API/API.dart';

class ChaptersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookRepostiory(api: Get.find<API>()));
    Get.put(ChaptersController(bookRepostiory: Get.find<BookRepostiory>()));
  }
}
