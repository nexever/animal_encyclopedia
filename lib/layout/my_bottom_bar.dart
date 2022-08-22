import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dashboard/about_app.dart';

import '../dashboard/home.dart';

import '../dashboard/videos_list.dart';

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
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex);

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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