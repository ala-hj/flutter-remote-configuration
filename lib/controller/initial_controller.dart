// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_application/models/books_model.dart';

import 'package:remote_application/models/config_model.dart';
import 'package:remote_application/models/movie_model.dart';
import 'package:remote_application/repository/configuration_repository.dart';

import 'package:remote_application/enum/enums.dart';

import 'package:remote_application/repository/book_repository.dart';
import 'package:remote_application/repository/movie_repository.dart';

class InitialController extends GetxController {
  InitialController(
      {this.bookRepostiory, this.movieRepostiory, this.configRepository});

  Rx<String> errorMessage = Rx<String>('');
  static InitialController to = Get.find();

  /// inject repo class dependcy
  final BookRepostiory bookRepostiory;
  final MovieRepostiory movieRepostiory;
  final ConfigRepository configRepository;

  /// create a reactive status from request with initial value , loading
  final statusMovie = Status.loading.obs;
  final statusBook = Status.loading.obs;

  /// Create a reactive ProudctModel
  final books = Rx<BooksModel>();
  final movies = Rx<MoviesModel>();
  Rx<ConfigurationModel> _configuration = Rx<ConfigurationModel>();
  ConfigurationModel get configurationModel => _configuration.value;
  @override
  void onInit() async => setUp();

  setUp() async {
    _configuration.bindStream(configRepository.configStream());

    configRepository.configStream().listen((event) {
      print(
          'listening to coming data version = ${event.version} Dark Theme = ${event.darkTheme} Color code = ${event.colorHexa}');
      // 0xFFE0F2F1

      Get.changeTheme(event.darkTheme
          ? ThemeData.dark().copyWith(
              primaryColor: Color(int.parse(event.colorHexa)),
              buttonColor: Color(
                int.parse(event.colorHexa),
              ),
            )
          : ThemeData.light().copyWith(
              primaryColor: Color(int.parse(event.colorHexa)),
              buttonColor: Color(
                int.parse(event.colorHexa),
              ),
            ));
      _configuration(event);
      update();
    });

    await bookRepostiory.getBooks().then((value) {
      books(value);
      statusBook(Status.success);
    }, onError: (error) {
      print(error.toString());
      statusBook(Status.error);
      Get.snackbar('Error Retrving books', error.toString(),
          duration: Duration(seconds: 5));
    });

    await movieRepostiory.getMovies().then((value) {
      movies(value);
      statusMovie(Status.success);
    }, onError: (error) {
      print(error.toString());
      statusMovie(Status.error);
      Get.snackbar('Error Retrving Movies', error.toString(),
          duration: Duration(seconds: 5));
    });
  }
}
