import 'package:remote_application/models/movie_model.dart';
import 'package:remote_application/services/API/API.dart';

class MovieRepostiory {
  final API _api;
  MovieRepostiory({API api}) : _api = api ?? API();
  init<MovieRepostiory>() async {
    await getMovies();
    return this;
  }

  Future<MoviesModel> getMovies({Map<String, dynamic> para}) async {
    try {
      final _response = await _api.get('movie', paramters: para);

      return MoviesModel.fromJson(_response);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
