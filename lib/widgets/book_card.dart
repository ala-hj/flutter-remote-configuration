import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remote_application/controller/initial_controller.dart';

import 'package:remote_application/models/books_model.dart';

class BookCard extends StatelessWidget {
  final BookModel data;
  final int index;
  BookCard({this.data, this.index});
  @override
  Widget build(BuildContext context) {
    InitialController controller = Get.find();
    return InkWell(
      onTap: () => Get.toNamed('/chapters', arguments: data),
      child: SizedBox(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 6.5,
            borderOnForeground: true,
            shadowColor: controller.configurationModel.darkTheme
                ? Colors.grey
                : Colors.black54,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                data.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
