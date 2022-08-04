import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget displayText(text, size, color,
    {bold = false, underline = false, italic = false}) {
  return Text(
    "$text",
    style: TextStyle(
        color: color,
        fontSize: double.parse(size.toString()),
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal),
  );
}