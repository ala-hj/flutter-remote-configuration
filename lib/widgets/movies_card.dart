import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_application/controller/initial_controller.dart';

import 'package:remote_application/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;
  final int index;
  MovieCard({this.data, this.index});
  @override
  Widget build(BuildContext context) {
    InitialController controller = Get.find();
    return InkWell(
      onTap: () => Get.bottomSheet(
        Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Academy Award Wins: ${data.academyAwardWins.toInt()}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Academy Award Nominations: ${data.academyAwardNominations.toInt()}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: "Revenue & Budget: ",
                    children: [
                      TextSpan(
                        text: '${data.boxOfficeRevenueInMillions}\$M ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '& ${data.budgetInMillions}\$M ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        ignoreSafeArea: false,
      ),
      child: SizedBox(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Card(
            margin: EdgeInsets.all(6),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 6.5,
            borderOnForeground: true,
            shadowColor: controller.configurationModel.darkTheme
                ? Colors.grey
                : Colors.black54,
            child: Stack(
              children: [
                Image.asset(
                  'assets/movies/${index + 1}.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      data.name,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
