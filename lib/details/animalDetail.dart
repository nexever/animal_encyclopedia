import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../layout/widgets.dart';
import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';

class AnimalDetail extends StatelessWidget {
  String imageName1;
  String imageName2;
  String imageName3;
  String name;
  String scientificName;
  String familyName;
  String kingdom;
  String weight;
  String height;
  String lifeSpan;
  String otherName;
  String nbrOfSpieces;
  String location;
  String detail;

  AnimalDetail({
    Key key,
    @required this.imageName1,
    @required this.imageName2,
    @required this.imageName3,
    @required this.name,
    @required this.scientificName,
    @required this.familyName,
    @required this.kingdom,
    @required this.weight,
    @required this.height,
    @required this.lifeSpan,
    @required this.otherName,
    @required this.nbrOfSpieces,
    @required this.location,
    @required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [imageName1, imageName2, imageName3];
    return Scaffold(
        backgroundColor: colorLight,
        appBar: new ReusableWidgets().getAppBar(context, name, true),
        body: Container(
            // color: Colors.red,
            margin: EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: CarouselSlider(
                        options: CarouselOptions(
                          // height: 200,
                          autoPlay: true,
                          aspectRatio: 1.5,
                          enlargeCenterPage: true,
                        ),
                        items: imgList
                            .map((item) => InkWell(
                                  child: Container(
                                      decoration: new BoxDecoration(
                                          color: colorSecondary,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              item,
                                            ),
                                          ))
                                      //child: Image.network(item, fit: BoxFit.cover, width: 1000,),
                                      ),
                                ))
                            .toList(),
                      )),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       child: Hero(
                      //         tag: "background_$name",
                      //         child: ClipRRect(
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               showDialog(
                      //                   context: context,
                      //                   builder: (context) =>
                      //                       pinchZoom(context, imageName1));
                      //             },
                      //             child: Card(
                      //               elevation: 2,
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(20)),
                      //               child: ClipRRect(
                      //                 borderRadius: BorderRadius.circular(20),
                      //                 child: FadeInImage.assetNetwork(
                      //                   placeholder: "assets/images/logo.png",
                      //                   image: imageName1,
                      //                   height: 200.0,
                      //                   fit: BoxFit.fill,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Material(
                      //         //color: Colors.red,
                      //         child: InkWell(
                      //           onTap: () async {
                      //             await showDialog(
                      //                 context: context,
                      //                 builder: (_) =>
                      //                     ImageDialog(imageName: imageName1));
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.fromLTRB(0, 13, 13, 0),
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(4.0),
                      //               /* child: Image.network(myData[index]["imageName1"],
                      //         height: 100.0, fit: BoxFit.fitHeight),*/
                      //               child: FadeInImage.assetNetwork(
                      //                   placeholder:
                      //                       "assets/images/animalloadder.gif",
                      //                   image: imageName2,
                      //                   height: displayHeight(context) * .1,
                      //                   width: displayWidth(context) * .15,
                      //                   fit: BoxFit.fill),
                      //             ),
                      //           ),
                      //         )),
                      //     Material(
                      //         color: colorBottomTabBtnLight,
                      //         child: InkWell(
                      //           onTap: () async {
                      //             await showDialog(
                      //                 context: context,
                      //                 builder: (_) =>
                      //                     ImageDialog(imageName: imageName2));
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.fromLTRB(0, 13, 13, 0),
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(4.0),
                      //               /* child: Image.network(myData[index]["imageName1"],
                      //         height: 100.0, fit: BoxFit.fitHeight),*/
                      //               child: FadeInImage.assetNetwork(
                      //                   placeholder:
                      //                       "assets/images/animalloadder.gif",
                      //                   image: imageName2,
                      //                   height: displayHeight(context) * .1,
                      //                   width: displayWidth(context) * .15,
                      //                   fit: BoxFit.fill),
                      //             ),
                      //           ),
                      //         )),
                      //     Material(
                      //         color: colorBottomTabBtnLight,
                      //         child: InkWell(
                      //           onTap: () async {
                      //             await showDialog(
                      //                 context: context,
                      //                 builder: (_) =>
                      //                     ImageDialog(imageName: imageName3));
                      //           },
                      //           child: Container(
                      //             margin: EdgeInsets.fromLTRB(0, 13, 13, 0),
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(4.0),
                      //               /* child: Image.network(myData[index]["imageName1"],
                      //         height: 100.0, fit: BoxFit.fitHeight),*/
                      //               child: FadeInImage.assetNetwork(
                      //                   placeholder:
                      //                       "assets/images/animalloadder.gif",
                      //                   image: imageName3,
                      //                   height: displayHeight(context) * .1,
                      //                   width: displayWidth(context) * .15,
                      //                   fit: BoxFit.fill),
                      //             ),
                      //           ),
                      //         )),
                      //   ],
                      // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Animal Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Scientific Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          scientificName,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Family Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          familyName,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Kingdom",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          kingdom,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          weight,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          height,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "LifeSpan",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          lifeSpan,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Other Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          otherName,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Number Of Spieces",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          nbrOfSpieces,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          location,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          "Detail",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 3, 10, 10),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: Text(
                                detail,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])
              ],
            )));
  }
}

class ImageDialog extends StatelessWidget {
  String imageName;

  ImageDialog({Key key, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: ClipRRect(
          child: FadeInImage.assetNetwork(
              placeholder: "assets/images/encyclopedia.png",
              image: imageName,
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
