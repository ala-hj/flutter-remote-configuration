import 'package:get/get.dart';
import 'package:remote_application/enum/enums.dart';
import 'package:remote_application/models/book_chapters_model.dart';
import 'package:remote_application/repository/book_repository.dart';

class ChaptersController extends GetxController {
  ChaptersController({this.bookRepostiory});
  String idBook;
  final BookRepostiory bookRepostiory;
  final status = Status.loading.obs;

  Rx<BookChaptersModel> chapters = Rx<BookChaptersModel>();

  // @override
  // void onInit() async => await setup();
  @override
  void onReady() async => await setup();
  Future setup() async {
    print('called setup');
    await bookRepostiory.getBookChapters(id: idBook).then((value) {
      print(value.documentsChapter.length);
      chapters(value);
      status(Status.success);
    }, onError: (err) {
      print(err.toString());
      status(Status.error);
      Get.snackbar('Error Retrving Chapters', err.toString(),
          duration: Duration(seconds: 5));
    });
  }
}
