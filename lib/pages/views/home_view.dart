import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:remote_application/controller/initial_controller.dart';
import 'package:remote_application/enum/enums.dart';
import 'package:remote_application/widgets/book_card.dart';
import 'package:remote_application/widgets/movies_card.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          Status statusMV = controller.statusMovie.value;
          Status statusBK = controller.statusMovie.value;

          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.import_contacts),
                        onPressed: () => Get.defaultDialog(
                          title: 'Message to the users',
                          middleText:
                              'Ok fella! I believe you are amazed from this work  so, you know what you have to do !',
                          textCancel: 'NAH!',
                          textConfirm: 'CLAP CLAP !',
                          buttonColor: Get.theme.primaryColor,
                          confirmTextColor: Colors.white,
                          cancelTextColor: Colors.red,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          controller.configurationModel?.version ??
                              'Loading ...',
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w200),
                        )),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(Icons.web),
                          onPressed: () => Get.toNamed('/web', arguments: {
                                'title': 'Ala Alhaj',
                                'URL': 'https://medium.com/@alla.hajj'
                              })),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Movies',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                statusMV == Status.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : statusMV == Status.error
                        ? Center(
                            child: Text(
                                'There is an error occured while looking for movie(s) :('),
                          )
                        : WaterfallFlow.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                MovieCard(
                              data: controller.movies.value.documents[index],
                              index: index,
                            ),
                            itemCount: controller.movies.value.documents.length,
                            gridDelegate:
                                SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  controller.configurationModel.gridColumn,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              lastChildLayoutTypeBuilder: (index) => index ==
                                      controller.movies.value.documents.length
                                  ? LastChildLayoutType.foot
                                  : LastChildLayoutType.none,
                            ),
                          ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                statusBK == Status.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : statusMV == Status.error
                        ? Center(
                            child: Text(
                                'There is an error occured while looking for movie(s) :('),
                          )
                        : WaterfallFlow.builder(
                            physics: ScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 10),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                BookCard(
                                  data: controller.books.value.documents[index],
                                  index: index,
                                ),
                            itemCount: controller.books.value.documents.length,
                            gridDelegate:
                                SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              lastChildLayoutTypeBuilder: (index) => index ==
                                      controller.movies.value.documents.length
                                  ? LastChildLayoutType.foot
                                  : LastChildLayoutType.none,
                            ))
              ],
            ),
          );
        },
      ),
    );
  }
}
