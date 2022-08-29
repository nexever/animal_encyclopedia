import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../layout/widgets.dart';

import '../models/about_app_model.dart';
import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';

class AboutUs extends StatefulWidget {
  // const AboutUs({Key key,}) : super(key: key);
  // static const String routeName = '/report_Screen';

  @override
  State<AboutUs> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUs> {
  bool isTouching = true, isTouch = false;
  String appLogo = 'assets/images/animalloadder.gif';
  @override
  void initState() {

    super.initState();
    //isTouch = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new ReusableWidgets().getAppBar(context, 'About Us', false),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   height: displayHeight(context) * .0,
                //   width: displayWidth(context) * .0,
                //   child: aboutAppData.length != 0
                //       ? Image(image: NetworkImage(aboutAppData[0].app_logo))
                //       : SizedBox(
                //           height: 10,
                //         ),
                //   // child: Image(
                //   //   image: AssetImage('assets/images/logo.png'),fit: BoxFit.fill,
                //   // ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/animalloadder.gif",
                      image: aboutAppData[0].app_logo,
                      // image: aboutAppData.length != 0
                      //     ? ''
                      //     : aboutAppData[0].app_logo,
                      height: displayHeight(context) * .15,
                      width: displayWidth(context) * .3,
                      fit: BoxFit.fill),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: aboutAppData.length != 0
                      ? textHeading1(context, aboutAppData[0].app_name)
                      : SizedBox(
                          height: 10,
                        ),
                  // Text("Become Vlogger", style: TextStyle(fontSize: displayHeight(context) * .022,fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: aboutAppData.length != 0
                      ? textlight(context, aboutAppData[0].app_version)
                      : SizedBox(
                          height: 10,
                        ),
                  //Text("Version 1.0", style: TextStyle(fontSize: displayHeight(context) * .015,fontWeight: FontWeight.w100,color: Colors.black87)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: aboutAppData.length != 0
                      ? textDescription(context, aboutAppData[0].app_detail)
                      : SizedBox(
                          height: 10,
                        ),
                  // Text("This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test",
                  //     style: TextStyle(fontSize: displayHeight(context) * .020,fontWeight: FontWeight.w300,color: Colors.black87)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            right: 1,
            left: 1,
            bottom: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Made with ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 16,
                    ),
                    Text(" by ", style: TextStyle(color: Colors.black)),
                    textHeading3(context, 'Nexever Pvt. Ltd.'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
