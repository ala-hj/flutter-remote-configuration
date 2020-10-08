import 'package:get/get.dart';
import 'package:remote_application/models/books_model.dart';
import 'package:remote_application/services/API/API.dart';

class CharacterRepostiory extends GetxService {
  final API _api;
  CharacterRepostiory({API api}) : _api = api ?? API();
  init<CharacterRepostiory>() async {
    await getChatacter();
    return this;
  }

  Future<BooksModel> getChatacter(
      {Map<String, dynamic> para, int limit = 10}) async {
    try {
      final _response =
          await _api.get('character', paramters: {'limit': limit});
      return BooksModel.fromJson(_response);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
