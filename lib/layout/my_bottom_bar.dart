import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animal_encyclopedia/layout/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dashboard/about_app.dart';

import '../dashboard/home.dart';

import '../dashboard/videos_list.dart';

import '../models/about_app_model.dart';
import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';



class AppEntryPoint extends StatefulWidget {
  int pageIndex;
  AppEntryPoint(this.pageIndex);

  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<AppEntryPoint> {
  //int _pageIndex ;
  PageController _pageController;

  List<Widget> tabPages = [
    HomeScreen(),


    AllVideoScreen(),
    //VideoScreen(),

    AboutUs(),


    //AllVideos(),
    //ShrinkTopListPage(),
    //CircularListPage(),
  ];

  @override
  void initState(){
    getAboutUs();
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex);

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  getAboutUs() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('animals')
        .orderBy("app_name", descending: true)
        .get();
    // print(snapshot.docs[0]9);

    List<AboutAppModel> _list = [];

    snapshot.docs.forEach((document) {
      AboutAppModel appModel =
      AboutAppModel.fromMap(document.data() as Map<String, dynamic>);
      _list.add(appModel);
    });
    if (_list.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {
        aboutAppData = _list;
        // if(aboutAppData.length != 0){
        //   appLogo = aboutAppData[0].app_logo;
        // }


        //String a = aboutAppData[0].app_name;
        // songsForDisplay = songs;
      });
    }

    // if (!widget.showList) {
    //   setState(() {
    //     _diceface = _random.nextInt(songs.length);
    //   });
    //   // var _rnd;
    //   // _diceface = _rnd.nextInt(6) +1 ;
    //   currentIndex = _diceface;
    //   // Navigator.of(context).push(MaterialPageRoute(
    //   //     builder: (context) => StreamPlayer(
    //   //         changeTrack: changeTrack,
    //   //         songInfo: songs[currentIndex],
    //   //         key: key)));
    // }

// foodNotifier.foodList = _foodList;
  }
  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog(barrierDismissible: true,
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },

          child: Container(
            color: Colors.white30,
            child: Dialog(
              child: Container(
                width: displayHeight(context) * 0.3,
                height: displayHeight(context) * 0.2,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(child:  textHeading1(context, 'Animal Encyclopedia')),
                    Center(child:  textlight(context, 'Do you want to exit the App?')),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            //return false when click on "NO"
                            child: const Text('No'),
                            style: ElevatedButton.styleFrom(
                                primary: colorPrimary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),

                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            //return true when click on "Yes"
                            child: const Text('Yes'),
                            style: ElevatedButton.styleFrom(
                                primary: colorPrimary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                    ],
                ),
              ),
              // title: Center(child: const Text('Animal Encyclopedia')),
              // content: Center(child: const Text('Do you want to exit the App?')),

            ),
          ),
        ),
      ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("BottomNavigationBar", style: TextStyle(color: Colors.white)),
        //   backgroundColor: Colors.deepPurple,
        // ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: displayHeight(context) * .018,color: colorPrimary,fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontSize: displayHeight(context) * .014,color: colorPrimary,fontWeight: FontWeight.w400),
          iconSize: displayHeight(context) * .025,selectedItemColor: colorPrimary,unselectedItemColor: colorSecondary,

          currentIndex: widget.pageIndex,
          onTap: onTabTapped,
          backgroundColor: colorVeryLight,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: colorLight),
                activeIcon: Icon(Icons.home_filled,color: colorSecondary),
                label: "Home",),
            // title: Text("Home",style: TextStyle(color: Color.fromRGBO(185, 185, 186, 1)),),backgroundColor: Colors.white),

            BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_outlined,color: colorLight),
              activeIcon: Icon(Icons.video_camera_back_rounded,color: colorSecondary),
              label: "Videos",),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined,color: colorLight),
                activeIcon: Icon(Icons.person,color: colorSecondary),
                label: "About Us"),
            // BottomNavigationBarItem(icon: Icon(Icons.group_outlined,color: Color.fromRGBO(185, 185, 186, 1)),
            //     activeIcon: Icon(Icons.group,color: Colors.black),
            //     title: Text("Social",style: TextStyle(color: Color.fromRGBO(185, 185, 186, 1)))),
          ],

        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: tabPages,
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this.widget.pageIndex = page;

    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}