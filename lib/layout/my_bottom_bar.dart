import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../dashboard/about_us.dart';
import '../dashboard/home.dart';
import '../dashboard/videos.dart';
import '../util/constants/app_colors.dart';



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
    AllVideos(),
    AboutUs(),


  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex);

    setState(() {
      //_loading = true;
      // Timer(Duration(microseconds: 1000), () async{
      //   await ChatServices.getMsgList().then((allClientLists){
      //     //setState(() {
      //       setState(() {
      //         listAllMessages = allClientLists;
      //         if(listAllMessages.length>0){
      //           //_msgForDisplay =listAllMessages;
      //          if(MessageListModel != null   ){
      //            for(int i=0; listAllMessages.length>i;i++ ){
      //              msgList = listAllMessages[i];
      //              msgCount = msgList.count;
      //              totalCount =  totalCount+msgCount;
      //            }
      //
      //              // msgList = listAllMessages[0];
      //
      //            if(totalCount==0){
      //              ConstantVariables.KEY_msgNotification = false;
      //            }else{
      //              ConstantVariables.KEY_msgNotification = true;
      //            }
      //          }
      //         }
      //         // if(listPrevMessages.length>0){
      //         //   _msgPrevForDisplay =listPrevMessages;
      //         //   isPreviousMsg = true;
      //         // }else{
      //         //   isPreviousMsg = false;
      //         // }
      //     //  });
      //      // _loading = false;
      //     });
      //   });
      //
      // });
    });
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
        currentIndex: widget.pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: colorBottomTabBtnLight),
              activeIcon: Icon(Icons.home_filled,color: colorSecondary),
              label: "Home",backgroundColor: colorSecondary),
             // title: Text("Home",style: TextStyle(color: Color.fromRGBO(185, 185, 186, 1)),),backgroundColor: Colors.white),

          BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_outlined,color: colorBottomTabBtnLight),
              activeIcon: Icon(Icons.video_camera_back_rounded,color: colorSecondary),
              label: "Videos",),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined,color: colorBottomTabBtnLight),
              activeIcon: Icon(Icons.person,color: colorSecondary),
              label: "About Us",backgroundColor: colorBottomTabBtnLight),
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