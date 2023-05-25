import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screen/materialscreen.dart';

import '../tools/applayout.dart';
import '../tools/appstate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double width = AppLayout.getwidth(context);
    double height = AppLayout.getheight(context);
    AppState provider = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black
        ),

          child: Column(
            children: [

              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                  color: Colors.blue
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 40,left: 20,right: 10),
                  child: Column(
                    children: [

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Suggested course",style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.white),)),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              child: materialscreen(name:provider.prefs.getString("course").toString()), type: PageTransitionType.fade));
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white
                              ),
                              child:
                              Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Text(provider.prefs.getString("course").toString(),style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.black),)),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("All Course",style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.white),)),


              Expanded(
                flex: 1,
                  child: FirebaseAnimatedList(
                    query: provider.dbref.child('playlist'),
                    defaultChild: const Center( child: CircularProgressIndicator()),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

                      return InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              child: materialscreen(name:snapshot.key.toString()), type: PageTransitionType.fade));
                        },
                        child: Card(
                          color: Colors.black,

                            child: Container(
                                width: width,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: snapshot.value.toString(),
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),

                                    Text(snapshot.key.toString(),style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.white),),

                                    SizedBox(height: 1,child: Container(color: Colors.white60,),)
                                  ],
                                )
                            ),
                          ),

                      );

                  },)
              )


            ],
          ),
        ),

    );
  }
}
