
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
  @override
  void initState() {
    getAboutUs();
    super.initState();
    //isTouch = false;

  }

  getAboutUs() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('animals')
        .orderBy("app_name", descending: true)
        .get();
   // print(snapshot.docs[0]9);

    List<AboutAppModel> _list = [];

    snapshot.docs.forEach((document) {
      AboutAppModel appModel = AboutAppModel.fromMap(document.data() as Map<String, dynamic>);
      _list.add(appModel);
    });
    if (_list.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {
        aboutAppData = _list;
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


    return Scaffold(
      // backgroundColor: loginBackgroundColor,
      extendBodyBehindAppBar: isTouch,
      appBar:new ReusableWidgets().getAppBar(context,'About Us',false),
      // AppBar(
      //
      //   title: Text(
      //     'About Us',
      //     style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: colorPrimary,
      // ),
      // drawer: isTouching?AppDrawer(currentSelected: 6): const SizedBox(
      //   height: 0,
      // ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: displayHeight(context) *.15,
                  width: displayWidth(context) *.3,
                  child: aboutAppData.length!= 0? Image(
                    image:NetworkImage(aboutAppData[0].app_logo)
                  ):     SizedBox(
                    height: 10,
                  ),
                  // child: Image(
                  //   image: AssetImage('assets/images/logo.png'),fit: BoxFit.fill,
                  // ),
                ) ,
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: aboutAppData.length!= 0?textHeading1(context,aboutAppData[0].app_name):  SizedBox(
                    height: 10,
                  ),
                  // Text("Become Vlogger", style: TextStyle(fontSize: displayHeight(context) * .022,fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(

                  child: aboutAppData.length!= 0?textlight(context,aboutAppData[0].app_version):  SizedBox(
                    height: 10,
                  ),
                  //Text("Version 1.0", style: TextStyle(fontSize: displayHeight(context) * .015,fontWeight: FontWeight.w100,color: Colors.black87)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child:aboutAppData.length!= 0?textDescription(context, aboutAppData[0].app_detail) : SizedBox(
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
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Made with ",style: TextStyle(color: Colors.black),),
                    Icon(Icons.favorite,color: Colors.red,size: 16,),
                    Text(" by ",style: TextStyle(color: Colors.black)),
                    textHeading3(context,'Nexever Pvt. Ltd.'),
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