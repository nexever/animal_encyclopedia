
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../layout/text_style.dart';
import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';
import 'home.dart';

class AllVideos extends StatefulWidget {
  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  //final images = Get.put(AllImages());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
          backgroundColor: colorPrimary,

          title: Text(
            'Videos',
            style: TextStyle(
                fontSize: displayHeight(context) * .025,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: GestureDetector(
                    onTap: () {
                      print(index);
                      Get.to(HomeScreen());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 45,
                                vertical: 45,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Grey_300),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/viral_video.jpg",
                                    ),
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        displayText("Name", 13.5, Colors.black,
                                            bold: true),
                                        displayText("Rosa", 15, Colors.grey),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        displayText("Title", 13.5, Colors.black,
                                            bold: true),
                                        displayText(
                                            "I am a Indian", 15, Colors.grey),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        displayText(
                                            "Track Name", 13.5, Colors.black,
                                            bold: true),
                                        displayText(
                                            "Bharat Desh Hammara", 15, Colors.grey),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
