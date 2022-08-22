import 'dart:convert';

// import 'package:firebase_admob/firebase_admob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';



import '../details/youtubePlayer.dart';
import '../layout/widgets.dart';
import '../models/animals_articles_model.dart';
import '../models/animals_vedios_model.dart';
import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';


class AllVideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<AllVideoScreen> {
  int selectedDialIndex;
  //var myData = new List();
  List<AnimalsVideosModel> myData = [];
  List<AnimalsVideosModel> searchList = [];
  //var searchList = new List();
  TextEditingController editingController = new TextEditingController();

  // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   testDevices: testDevice != null ? <String>[testDevice] : null,
  //   nonPersonalizedAds: true,
  //   keywords: <String>['Hijab', 'Style'],
  // );
  //
  // InterstitialAd _interstitialAd;
  //
  //
  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: "ca-app-pub-5295564814934759/8284211755",
  //       //Change Interstitial AdUnitId with Admob ID
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("IntersttialAd $event");
  //       });
  // }



  @override
  void initState() {
    //Change appId With Admob Id
    // FirebaseAdMob.instance.initialize(appId: "ca-app-pub-5295564814934759~2236025763");
    // createInterstitialAd()
    //   ..load()
    //   ..show();
   // getAboutUs();
    super.initState();
    selectedDialIndex = 1;
  }
  @override
  void dispose() {
    //_interstitialAd.dispose();
    super.dispose();
  }


//   getAboutUs() async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('animals/animals_videos')
//         .orderBy("video_name", descending: true)
//         .get();
//     // print(snapshot.docs[0]9);
//
//     List<AnimalsVideosModel> _list = [];
//
//     snapshot.docs.forEach((document) {
//       AnimalsVideosModel appModel = AnimalsVideosModel.fromMap(document.data() as Map<String, dynamic>);
//       _list.add(appModel);
//     });
//     if (_list.length == 0) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       setState(() {
//         vloggerVideosList = _list;
//         //String a = aboutAppData[0].app_name;
//         // songsForDisplay = songs;
//       });
//     }
//
//     // if (!widget.showList) {
//     //   setState(() {
//     //     _diceface = _random.nextInt(songs.length);
//     //   });
//     //   // var _rnd;
//     //   // _diceface = _rnd.nextInt(6) +1 ;
//     //   currentIndex = _diceface;
//     //   // Navigator.of(context).push(MaterialPageRoute(
//     //   //     builder: (context) => StreamPlayer(
//     //   //         changeTrack: changeTrack,
//     //   //         songInfo: songs[currentIndex],
//     //   //         key: key)));
//     // }
//
// // foodNotifier.foodList = _foodList;
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: new ReusableWidgets().getAppBar(context,'Videos',false),
      body: Container(

        // decoration: BoxDecoration(
        //     color: Color.fromRGBO(24, 27, 44, 1),
        //     image: new DecorationImage(
        //         image: new AssetImage("lib/assets/images/splashbg.png"),
        //         fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: articlesForDisplay.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildList(context, index);
                  }),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildList(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: colorList,

        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
        child: ListTile(
          onTap: () {
            {
              // createInterstitialAd()
              //   ..load()
              //   ..show();

              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => MyYoutubePlayer(url: "https://www.youtube.com/watch?v="+(articlesForDisplay[index].video_url),title: (articlesForDisplay[index].name))),
//
                  // MaterialPageRoute(
                  //     builder: (context) => ArticlesDetails(
                  //         title: articlesForDisplay[index].title,
                  //         heading: articlesForDisplay[index].heading,
                  //         detail: articlesForDisplay[index].detail,
                  //         imagepath: articlesForDisplay[index].articleImage1))
              );
            }
          },
          shape: StadiumBorder(
            side: BorderSide(
              color: Colors.white,
              width: 0.1,
            ),
          ),
          leading: CircleAvatar(radius:20,
            backgroundColor: colorVeryLight,
            backgroundImage: NetworkImage(
                articlesForDisplay[index].animalImage1,scale: 8
            ),
          ),
          title: SizedBox(
            width: displayHeight(context) * .3,
            child: textHeading1(context, articlesForDisplay[index].name,),
          ),
          // subtitle: Expanded(
          //     child: Text(
          //       articlesForDisplay[index].heading,
          //       style: TextStyle(color: Colors.white30),
          //     )),
          // dense: true,
          trailing: Opacity(
              opacity: 0.3,
              child: Icon(
                Icons.video_camera_back_outlined,
                color: colorPrimary,
                size: 20,
              )),
        ),
        elevation: 10.0, //
      ),
    );
  }


  // void playYoutubeVideo(String videoEndPoint) {
  //   FlutterYoutube.playYoutubeVideoByUrl(
  //     apiKey: "AIzaSyDeRQDAEpX713iVm0QsyLOue_XDbQ8-pw0",
  //     videoUrl: "https://www.youtube.com/watch?v=" + videoEndPoint,
  //   );
  // }
  void searchAnimal(String value) {
    searchList.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }

    myData.forEach((animalData) {
      print('name ${animalData.video_name.toString()}  $value');
      if (/*animalData["name"].toString().contains(value) ||*/
      animalData.video_name.toString().toUpperCase().startsWith(value)
      // ||
      // animalData..toString().toLowerCase().startsWith(value)
      )
      {
        searchList.add(animalData);
      }
    });

    setState(() {});
  }
  searchListView() {
    return Container(
        child: new ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              // print("index$index");
              // print("search list==>"+ searchList[index]);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: colorList,
                  child: new InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => MyYoutubePlayer(url: "https://www.youtube.com/watch?v=S50SkXhWjEQ",title: "Testing youtubeTitle",)),
                          MaterialPageRoute(builder: (context) => MyYoutubePlayer(url: "https://www.youtube.com/watch?v="+(searchList[index].video_url),title: (searchList[index].video_name))),
                        );
                        // playYoutubeVideo(searchList[index]["imageName1"]);
                        // playYoutubeVideo("ZWc8mrH6xLs");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            // 'https://i.ytimg.com/an_webp/ZWc8mrH6xLs/mqdefault_6s.webp?du=3000&sqp=CPemwpcG&rs=AOn4CLD5fzlLlRH2y5_qpeffUSzRHntfkw'
                                           // "https://i.ytimg.com/an_webp/" +
                                                myData[index].video_logo,
                                          )))),
                            ),
                            Flexible(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  searchList[index].video_name,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                //
                                // Text(
                                //   "Source: " + searchList[index]["kingdom"],
                                //   style: TextStyle(
                                //       color: Colors.black, fontSize: 12),
                                // ),
                              ],
                            ))
                          ],
                        ),
                      )),)
                ,
              );
            }));
  }
}
// Widget _buildListView() {
//   return FutureBuilder(
//     builder: (context, snapshot) {
//       myData = json.decode(snapshot.data.toString());
//       return new ListView.builder(
//           shrinkWrap: true,
//           itemCount: myData == null ? 0 : myData.length,
//           itemBuilder: (BuildContext ctxt, int index) {
//
//             return Padding(
//               // padding: const EdgeInsets.all(8.0),
//               padding: const EdgeInsets.fromLTRB(10, 5, 10, 0), // left top right bottom
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 color: colorList,
//                 child: new InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         // MaterialPageRoute(builder: (context) => MyYoutubePlayer(url: "https://www.youtube.com/watch?v=S50SkXhWjEQ",title: "Testing youtubeTitle",)),
//                         MaterialPageRoute(builder: (context) => MyYoutubePlayer(url: "https://www.youtube.com/watch?v="+(myData[index].video_url),title: (myData[index].video_name))),
//                       );
//                       // playYoutubeVideo(myData[index]["imageName1"]);
//                       // playYoutubeVideo("ZWc8mrH6xLs");
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Card(
//                               elevation: 6,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: Container(
//                                     height: displayHeight(context) * .1,
//                                     width: displayWidth(context) * .3,
//                                     //margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       // color: Color(orangeColor),
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Expanded(child: Image.network(
//                                               // 'https://i.ytimg.com/an_webp/ZWc8mrH6xLs/mqdefault_6s.webp?du=3000&sqp=CPemwpcG&rs=AOn4CLD5fzlLlRH2y5_qpeffUSzRHntfkw',
//                                               // "https://i.ytimg.com/an_webp/" +
//                                                   myData[index].video_logo ,
//                                               height: displayHeight(context) * .1,
//                                               width: displayWidth(context) * .3,
//                                               fit: BoxFit.fill,
//                                             ))
//
//                                           ],
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                               children: [
//                                                 Image.asset(
//                                                   "assets/images/youtube.png",
//                                                   height: displayHeight(context) * .045,
//                                                   width: displayWidth(context) * .065,
//                                                   fit: BoxFit.fitHeight,
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                             ),
//                           ),
//                           Flexible(child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               textHeading1(context, myData[index].video_name),
//                               // Text(
//                               //   myData[index]["name"],
//                               //   style: TextStyle(
//                               //       color: Colors.black, fontSize: 18),
//                               // ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               // Text(
//                               //   "Family: " + myData[index]["family"],
//                               //   style: TextStyle(
//                               //       color: Colors.black, fontSize: 12),
//                               // ),
//                               Row(
//                                 children: [
//                                   // Text(
//                                   //   "Kingdom: " + myData[index]["kingdom"],
//                                   //   style: TextStyle(
//                                   //       color: Colors.black, fontSize: 12),
//                                   // ),
//                                   textHeading3(context, "Type: "),
//                                   textDescription(context, myData[index].video_detail)
//                                 ],
//                               ),
//                               // Text(
//                               //   "Type: " + myData[index]["kingdom"],
//                               //   style: TextStyle(
//                               //       color: Colors.black, fontSize: 12),
//                               // ),
//                             ],
//                           ))
//
//                         ],
//                       ),
//                     )),
//               ),
//             );
//           });
//     },
//     future: getAboutUs(),
//   );
// }