import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../details/animalDetail.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../layout/widgets.dart';
import '../models/animals_articles_model.dart';
import '../util/constants/size_config.dart';

const String testDevice = 'MobileId';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myData = new List();
  var searchList = new List();

  TextEditingController editingController = new TextEditingController();
  // static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   testDevices: testDevice != null ? <String>[testDevice] : null,
  //   nonPersonalizedAds: true,
  //   keywords: <String>['Animal', 'Encyclopedia'],
  // );
  //
  // BannerAd _bannerAd;
  // InterstitialAd _interstitialAd;
  //
  // BannerAd createBannerAd() {
  //   return BannerAd(
  //       adUnitId: "ca-app-pub-5295564814934759/2801472326",
  //       //Change BannerAd adUnitId with Admob ID
  //       size: AdSize.banner,
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("BannerAd $event");
  //       });
  // }

  // InterstitialAd createInterstitialAd() {
  //   return InterstitialAd(
  //       adUnitId: "ca-app-pub-5295564814934759/9175308984",
  //       //Change Interstitial AdUnitId with Admob ID
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("IntersttialAd $event");
  //       });
  // }

  @override
  void initState() {
    // FirebaseAdMob.instance
    //     .initialize(appId: "ca-app-pub-5295564814934759~3504497132");
    // //Change appId With Admob Id
    // _bannerAd = createBannerAd()
    //   ..load()
    //   ..show();
    getArticles();
    super.initState();
  }

  @override
  void dispose() {
    // _bannerAd.dispose();
    // _interstitialAd.dispose();
    super.dispose();
  }

  getArticles() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('animals')
        .orderBy("name", //descending: true
    )
        .get();

    List<Articles> _list = [];

    snapshot.docs.forEach((document) {
      Articles articles = Articles.fromMap(document.data() as Map<String, dynamic>);
      _list.add(articles);
    });
    if (_list.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      setState(() {
        articlesForDisplay = _list;
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
      appBar: new ReusableWidgets().getAppBar(context,'Home',false),

      body: Container(
        //padding: EdgeInsets.fromLTRB(0, 0, 0, 48),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                //shadowColor: colorRedReports,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //color: colorRedReports,
                child: Container(
                 // margin: EdgeInsets.all(3),
                 //  decoration: BoxDecoration(
                 //    color: Colors.white,
                 //    borderRadius: BorderRadius.circular(10.0),
                 //    border: Border.all(color: Color(0xFF4E342E), width: 1),
                 //
                 //
                 //  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                          child: Image(
                            image: AssetImage("assets/images/search.png"),
                              height: displayHeight(context) * .045,
                              width: displayWidth(context) * .045,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        child: TextField(
                          style: TextStyle(
                              fontSize: displayHeight(context) * .022,
                              color: Colors.black87),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),

                            hintText: 'Search for animal...',
                          ),
                          onChanged: (value) {
                            searchAnimal(value);
                          },
                          controller: editingController,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  (searchList.length != 0 || editingController.text.isNotEmpty)
                      ? searchListView()
                      : _buildGridView(),
              //: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  void searchAnimal(String value) {
    searchList.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }

    articlesForDisplay.forEach((animalData) {
      print('name ${animalData.name.toString()}  $value');
      if (/*animalData["name"].toString().contains(value) ||*/
          animalData.other_name.toString().toUpperCase().startsWith(value)
              // || animalData..toString().toLowerCase().startsWith(value)
      )
      {
        searchList.add(animalData);
      }
    });

    setState(() {});
  }



   _buildGridView() {
    return MasonryGridView.count(
       crossAxisCount: 3,
       crossAxisSpacing: 10,
       mainAxisSpacing: 12,

       itemCount: articlesForDisplay == null
           ? 0
           : articlesForDisplay.length,
       itemBuilder: (context, int index) {

         return GestureDetector(
           onTap: (){
             // createInterstitialAd()
             //   ..load()
             //   ..show();
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => AnimalDetail(
                         imageName1: articlesForDisplay[index].animalImage1,
                         imageName2: articlesForDisplay[index].animalImage1,
                         imageName3: articlesForDisplay[index].animalImage1,
                         name: articlesForDisplay[index].name,
                         otherName: articlesForDisplay[index].other_name,
                         detail: articlesForDisplay[index].detail,
                         scientificName: articlesForDisplay[index].scientific_name,
                         familyName: articlesForDisplay[index].family,
                         kingdom: articlesForDisplay[index].kingdom,
                         weight: articlesForDisplay[index].weight,
                         height: articlesForDisplay[index].height,
                         lifeSpan:articlesForDisplay[index].life_span,
                         nbrOfSpieces: articlesForDisplay[index].no_of_species,
                         location: articlesForDisplay[index].location,

                     )
                 )
             );
           },
           child: ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(10)),
             child: FadeInImage.memoryNetwork(
               placeholder: kTransparentImage,
               image: (articlesForDisplay[index].animalImage1),
               fit: BoxFit.cover,
             ),
           ),

         );
       },

       // staggeredTileBuilder: (index) {
       //   return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
       // }
     );
  }

  searchListView() {
    return Container(
      child: new GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: searchList == null ? 0 : searchList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Container(
                  child: Card(
                      child: Column(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          topLeft: Radius.circular(4.0)),
                      /* child: Image.network(myData[index]["imageName1"],
                                        height: 100.0, fit: BoxFit.fitHeight),*/
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/encyclopedia.png",
                          image: searchList[index]["imageName1"],
                          height: 100.0,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      searchList[index]["name"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ))),
              Container(
                child: new InkResponse(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimalDetail(
                                imageName1: searchList[index]["imageName1"],
                                imageName2: searchList[index]["imageName2"],
                                imageName3: searchList[index]["imageName3"],
                                name: searchList[index]["name"],
                                scientificName: searchList[index]
                                    ["scientific_name"],
                                familyName: searchList[index]["family"],
                                kingdom: searchList[index]["kingdom"],
                                weight: searchList[index]["weight"],
                                height: searchList[index]["height"],
                                lifeSpan: searchList[index]["life_span"],
                                otherName: searchList[index]["other_name"],
                                nbrOfSpieces: searchList[index]
                                    ["no_of_species"],
                                location: searchList[index]["location"],
                                detail: searchList[index]["detail"])));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


// Widget _buildListView() {
//   return FutureBuilder(
//     builder: (context, snapshot) {
//       myData = json.decode(snapshot.data.toString());
//
//       return new GridView.builder(
//         gridDelegate:
//         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: myData == null ? 0 : myData.length,
//         itemBuilder: (BuildContext context, int index) {
//           print(myData[index]["imageName1"]);
//           return Stack(
//             children: <Widget>[
//               Container(
//                   child: Card(
//                       child: Column(
//                         children: <Widget>[
//                           Expanded(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(4.0),
//                                   topLeft: Radius.circular(4.0)),
//                               /* child: Image.network(myData[index]["imageName1"],
//                                       height: 100.0, fit: BoxFit.fitHeight),*/
//                               child: FadeInImage.assetNetwork(
//                                   placeholder: "assets/images/encyclopedia.png",
//                                   image: myData[index]["imageName1"],
//                                   height: 100.0,
//                                   fit: BoxFit.fitHeight),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                             child: Text(
//                               myData[index]["name"],
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                           )
//                         ],
//                       ))),
//               Container(
//                 child: new InkResponse(
//                   onTap: () {
//                     createInterstitialAd()
//                       ..load()
//                       ..show();
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AnimalDetail(
//                                 imageName1: myData[index]["imageName1"],
//                                 imageName2: myData[index]["imageName2"],
//                                 imageName3: myData[index]["imageName3"],
//                                 name: myData[index]["name"],
//                                 scientificName: myData[index]
//                                 ["scientific_name"],
//                                 familyName: myData[index]["family"],
//                                 kingdom: myData[index]["kingdom"],
//                                 weight: myData[index]["weight"],
//                                 height: myData[index]["height"],
//                                 lifeSpan: myData[index]["life_span"],
//                                 otherName: myData[index]["other_name"],
//                                 nbrOfSpieces: myData[index]["no_of_species"],
//                                 location: myData[index]["location"],
//                                 detail: myData[index]["detail"])));
//                   },
//                 ),
//               )
//             ],
//           );
//         },
//       );
//     },
//     future:
//     DefaultAssetBundle.of(context).loadString("assets/res/animal.json"),
//   );
// }