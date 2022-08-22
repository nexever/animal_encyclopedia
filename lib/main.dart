import 'dart:async';

import 'package:animal_encyclopedia/layout/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'dashboard/home.dart';
import 'layout/my_bottom_bar.dart';
import 'util/constants/size_config.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animal Encyclopedia',
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: LaunchingPage())));
  }
}

class LaunchingPage extends StatefulWidget {
  launchingPageUi createState() => launchingPageUi();
}

class launchingPageUi extends State<LaunchingPage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF4E342E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: displayHeight(context) * 0.19,
                    width: displayWidth(context) * 0.5,

                    // height: 150,
                    child: Image(
                      image: AssetImage('assets/images/splash_logo.png'),fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ) ,
            Container(
               child: textHeadingWhite(context,'Animal Encyclopedia'),
               //   Text("Animal Encyclopedia", style: TextStyle(fontSize: displayHeight(context) * 0.03,fontWeight: FontWeight.bold,color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTime();
    });
  }


    startTime() {
      Timer(Duration(seconds: 3),
              () =>
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => AppEntryPoint(_pageIndex)
          ),
          ModalRoute.withName("/Home")
      ));

    }


}
