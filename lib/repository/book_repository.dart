import 'package:get/state_manager.dart';
import 'package:remote_application/models/book_chapters_model.dart';
import 'package:remote_application/models/books_model.dart';
import 'package:remote_application/services/API/API.dart';

class BookRepostiory extends GetxService {
  final API _api;
  BookRepostiory({API api}) : _api = api ?? API();
  init<BookRepostiory>() async {
    await getBooks();
    await getBookChapters();
    return this;
  }

  Future<BooksModel> getBooks({Map<String, dynamic> para}) async {
    try {
      final _response = await _api.get('book', paramters: para);
      return BooksModel.fromJson(_response);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<BookChaptersModel> getBookChapters({String id}) async {
    try {
      final _response = await _api.get('book/$id/chapter');
      return BookChaptersModel.fromJson(_response);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
