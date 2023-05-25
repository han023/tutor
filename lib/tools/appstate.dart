import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutor/screen/qascreen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../screen/homescreen.dart';

class AppState extends ChangeNotifier{

  var prefs;
  Future<void> sharepref()async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> change_screen(BuildContext context)async{
    Future.delayed(const Duration(seconds: 4),(){
      try{
        if(prefs.containsKey("course")) {
          Navigator.pushReplacement(context, PageTransition(
              child: const HomeScreen(), type: PageTransitionType.fade));
        } else{
          Navigator.pushReplacement(context, PageTransition(
              child: const qascreen(), type: PageTransitionType.fade));
        }
      } catch(e){}
    });
  }

  var inter;
  Future<void> checkInternet()async{
    inter =  await InternetConnectionChecker().hasConnection ;
  }

  late YoutubePlayerController controller;

  bool check = false;
  bool newcheck = false;


  DatabaseReference dbref = FirebaseDatabase.instance.ref();

}