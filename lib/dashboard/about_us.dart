
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';



class AboutUs extends StatefulWidget {

  const AboutUs({Key key,}) : super(key: key);
  static const String routeName = '/report_Screen';

  @override
  State<AboutUs> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUs> {
  bool isTouching = true, isTouch = false;
  @override
  void initState() {
    super.initState();
    //isTouch = false;

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
     // backgroundColor: loginBackgroundColor,
      extendBodyBehindAppBar: isTouch,
      appBar:AppBar(
        // title: const Text("Reports" ),
        title: Text(
          'About Us',
          style: TextStyle(
              fontSize: displayHeight(context) * .025,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: colorPrimary,
      ),
      // drawer: isTouching?AppDrawer(currentSelected: 6): const SizedBox(
      //   height: 0,
      // ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              //color: Color(0xFF4E342E),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 150,
                          child: Image(
                            image: AssetImage('assets/images/splash_logo.png'),fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ) ,
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child:
                    Text("Animal Encyclopedia", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child:
                    Text("Version 1.0", style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.black87)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child:
                    Text("This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test This is the demo test",
                        style: TextStyle(fontSize: displayHeight(context) * .020,fontWeight: FontWeight.w300,color: Colors.black87)),

                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            right: 1,
            left: 1,
            bottom: 5,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Made with Love by", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.black87)),
                      //Icon(Icons.heart_broken),
                      Text(" Nexever Pvt. Ltd.", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


