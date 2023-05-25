import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screen/videoscreen.dart';

import '../tools/applayout.dart';
import '../tools/appstate.dart';

class materialscreen extends StatelessWidget {
  materialscreen({Key? key,required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {

    double width = AppLayout.getwidth(context);
    double height = AppLayout.getheight(context);
    AppState provider = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,

        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: FirebaseAnimatedList(
                    query: provider.dbref.child('tutorial').child(name),
                    defaultChild: const Center( child: CircularProgressIndicator()),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

                      Map data = snapshot.value as Map;

                      return InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              child: videoscreen(id:data["id"],des:data["text"]), type: PageTransitionType.fade));
                        },
                        child: Card(
                          color: Colors.white10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: width,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: data["link"],
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),

                                    Text(data["text"],style: GoogleFonts.sigmarOne(fontSize: 20,color: Colors.white),),
                                  ],
                                )
                            ),
                          ),
                        ),
                      );

                    },)
              ),
            ],
          ),
        ),

      ),
    );
  }
}
