import 'package:flutter/material.dart';

Widget pinchZoom(BuildContext context, image) {
  return Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      color: Colors.transparent,
      height: 450,
      //width: 450,
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
              flex: 4,
              child: GestureDetector(
                onDoubleTap: () {
                  print("object");
                  Navigator.pop(context);
                },
                child: InteractiveViewer(
                  clipBehavior: Clip.none,
                  child: Image.asset(
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