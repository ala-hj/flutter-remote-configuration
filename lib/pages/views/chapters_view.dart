import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remote_application/controller/chapters_controller.dart';
import 'package:remote_application/enum/enums.dart';

class ChaptersView extends GetView<ChaptersController> {
  @override
  Widget build(BuildContext context) {
    print(Get.arguments.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Get.arguments.name}',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: GetX<ChaptersController>(
        initState: (state) async {
          controller.idBook = Get.arguments.id;
        },
        builder: (ChaptersController data) {
          Status status = data.status.value;
          if (status == Status.loading)
            return GetPlatform.isIOS
                ? Center(child: CupertinoActivityIndicator())
                : Center(child: CircularProgressIndicator());
          if (status == Status.error)
            return Center(
              child: Text(' there is error '),
            );
          return ListView.builder(
            itemCount: data.chapters.value.documentsChapter.length,
            padding: EdgeInsets.all(5),
            itemBuilder: (context, index) => Card(
              elevation: 6,
              shadowColor: Colors.black54,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(
                    data.chapters.value.documentsChapter[index].chapterName),
              ),
            ),
          );
        },
      ),
    );
  }
}
