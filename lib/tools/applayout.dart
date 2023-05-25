import 'package:flutter/material.dart';

class AppLayout{
  static getwidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static getheight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}