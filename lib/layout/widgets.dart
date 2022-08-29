import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/constants/app_colors.dart';
import '../util/constants/size_config.dart';
//import '../util/observer_veriables.dart';

class ReusableWidgets {
  getAppBar(BuildContext context,String title,bool isLeadingIcon) {
    return AppBar(
      leading: isLeadingIcon?IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ):IconButton(
        icon: Icon(Icons.settings, color: colorPrimary),
        onPressed: () => '',
      ),
      title: Text(title, style: TextStyle(
          fontSize: displayHeight(context) * .025,
          color: Colors.white),),
      centerTitle: true,
      backgroundColor: colorPrimary,
    );
  }
}



Widget pinchZoom(BuildContext context, image) {
  return Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      color: Colors.transparent,
      height: 300,
      child: Column(
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              )),
          Expanded(
              flex: 5,
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(context);
                },
                child: InteractiveViewer(
                  clipBehavior: Clip.none,
                  child: Image.network(
                    "${image}",
                    fit: BoxFit.fill,
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}

Widget exit() {
  return Dialog(
    //child: ,
  );
}

Widget displayText(text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 19,
        fontFamily: "Amazon Ember"),
  );
}

textHeadingWhite(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .022,fontWeight: FontWeight.bold,color: Colors.white));
}

textHeading1(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .022,fontWeight: FontWeight.bold,color: Colors.black));
}

textHeading2(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .020,color: Colors.white,fontWeight: FontWeight.w700));
}

textHeading3(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .018,color: Colors.black87,fontWeight: FontWeight.w500));
}

textDescription(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .020,fontWeight: FontWeight.w300,color: Colors.black87));
}
textlight(BuildContext context,String title) {
  return Text(title,
      style: TextStyle(fontSize: displayHeight(context) * .015,fontWeight: FontWeight.w100,color: Colors.black87));
}

//final observer = Get.put(ObserveableVariables());
// Widget carouselSlider(BuildContext context) {
//
//   var pa = PageController(initialPage: observer.pal.value,viewportFraction: 0.8);
//   var colors = [Colors.red, Colors.black];
//   // Timer.periodic(Duration(seconds: 5), (Timer) {
//   //   pa.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
//   // });
//
//   return Column(children: [
//     SizedBox(
//       width: double.infinity,
//       height: displayHeight(context) * .2,
//       child: PageView.builder(
//           physics: BouncingScrollPhysics(),
//           controller: pa,
//           onPageChanged: (index) {
//             observer.currentIndex.value = index % colors.length;
//           },
//           itemBuilder: (context, index) {
//             return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: GestureDetector(
//                   onTap: () {
//                     print(index);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: colors[index % colors.length],
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//                             ),
//                             fit: BoxFit.cover,
//                           )),
//                     ),
//                   ),
//                 ));
//           }),
//     ),
//     SizedBox(
//       height: 10,
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         for (var i = 0; i < colors.length; i++)
//           indicators(observer.currentIndex.value == i)
//       ],
//     )
//   ]);
// }

Widget indicators(isSelected) {
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: Container(
      width: isSelected ? 10 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey, shape: BoxShape.circle),
    ),
  );
}
