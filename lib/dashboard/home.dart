import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../animalDetail.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Animal', 'Encyclopedia'],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-5295564814934759/2801472326",
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-5295564814934759/9175308984",
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5295564814934759~3504497132");
    //Change appId With Admob Id
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: displayHeight(context) * .025,
              color: Colors.white),
        ),
        backgroundColor: Color(0xFF4E342E),
      ),
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
                            width: 20,
                            height: 20,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF4E342E)),
                            ),
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

    myData.forEach((animalData) {
      print('name ${animalData["name"].toString()}  $value');
      if (/*animalData["name"].toString().contains(value) ||*/
          animalData["name"].toString().toUpperCase().startsWith(value) ||
              animalData["name"].toString().toLowerCase().startsWith(value)) {
        searchList.add(animalData);
      }
    });

    setState(() {});
  }



   _buildGridView() {
    return FutureBuilder(
      builder: (context, snapshot) {
        myData = json.decode(snapshot.data.toString());

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,

            itemCount: myData == null
                ? 0
                : myData.length,
            itemBuilder: (context, int index) {

              return GestureDetector(
                onTap: (){
                  createInterstitialAd()
                    ..load()
                    ..show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetail(
                              imageName1: myData[index]["imageName1"],
                              imageName2: myData[index]["imageName2"],
                              imageName3: myData[index]["imageName3"],
                              name: myData[index]["name"],
                              scientificName: myData[index]
                              ["scientific_name"],
                              familyName: myData[index]["family"],
                              kingdom: myData[index]["kingdom"],
                              weight: myData[index]["weight"],
                              height: myData[index]["height"],
                              lifeSpan: myData[index]["life_span"],
                              otherName: myData[index]["other_name"],
                              nbrOfSpieces: myData[index]["no_of_species"],
                              location: myData[index]["location"],
                              detail: myData[index]["detail"])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: (myData[index]["imageName1"]),
                    fit: BoxFit.cover,
                  ),
                ),

              );
            },

            // staggeredTileBuilder: (index) {
            //   return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            // }
          ),
        );
      },
      future:
      DefaultAssetBundle.of(context).loadString("assets/res/animal.json"),
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