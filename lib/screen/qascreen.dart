import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screen/homescreen.dart';

import '../tools/applayout.dart';
import '../tools/appstate.dart';

class qascreen extends StatelessWidget {
  const qascreen({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.only(left: 10 ,right: 10,bottom: 10,top: 50),
          child: Column(
            children: [

                Align( alignment: Alignment.centerLeft,
                    child: Text("Choose Course",style: GoogleFonts.sigmarOne(color: Colors.white,fontSize: 30),)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                          onTap: (){
                            provider.prefs.setString("course","photoshop");
                            Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                          },
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("Photoshop",style: GoogleFonts.sigmarOne(),)),
                          ),
                        ),


                        InkWell(
                          onTap: (){
                            provider.prefs.setString("course","illustrator");
                            Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                          },
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("illustrator",style: GoogleFonts.sigmarOne(),)),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            provider.prefs.setString("course","premier pro");
                            Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                          },
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("Premier",style: GoogleFonts.sigmarOne(),)),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            provider.prefs.setString("course","audition");
                            Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                          },
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("audition",style: GoogleFonts.sigmarOne(),)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: height*0.04,),

              InkWell(
                onTap: (){
                  if(provider.check == true){
                    provider.check = false;
                    provider.notifyListeners();
                  }else{
                    provider.check = true;
                    provider.notifyListeners();
                  }
                },
                child: Align( alignment: Alignment.centerLeft,
                    child: Text("click here to choose by us",style: GoogleFonts.sigmarOne(color: Colors.white,fontSize: 20),)),
              ),

              Visibility(
                  visible: provider.check,
                  child: Container(
                    child: Column(
                      children: [
                        Text("Are you creative",style: GoogleFonts.sigmarOne(color: Colors.white,fontSize: 25),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            InkWell(
                              onTap: (){
                                provider.prefs.setString("course","photoshop");
                                Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Center(child: Text("Yes",style: GoogleFonts.sigmarOne(),)),
                              ),
                            ),


                            InkWell(
                              onTap: (){
                                  provider.newcheck = true;
                                  provider.notifyListeners();
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Center(child: Text("NO",style: GoogleFonts.sigmarOne(),)),
                              ),
                            ),

                          ],
                        ),

                        Visibility(
                            visible: provider.newcheck,
                            child: Container(
                              child: Column(
                                children: [
                                  Text("Are you HardWorker",style: GoogleFonts.sigmarOne(color: Colors.white,fontSize: 25),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      InkWell(
                                        onTap: (){
                                          provider.prefs.setString("course","illustrator");
                                          Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Center(child: Text("Yes",style: GoogleFonts.sigmarOne(),)),
                                        ),
                                      ),


                                      InkWell(
                                        onTap: (){
                                          provider.prefs.setString("course","audition");
                                          Navigator.pushReplacement(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.fade));
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Center(child: Text("NO",style: GoogleFonts.sigmarOne(),)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),

                            ))

                      ],
                    )),
              )

            ],
          ),
        ),

      ),


    );
  }
}
