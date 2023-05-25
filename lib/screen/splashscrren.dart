import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../tools/applayout.dart';
import '../tools/appstate.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context);
    provider.change_screen(context);
    provider.sharepref();

    double width = AppLayout.getwidth(context);
    double height = AppLayout.getheight(context);

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
                        height: 500,
                        width: width,
                        child: Lottie.asset('assets/anim.json'),
                ),

                Text("TuTor",style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.white,))


              ],
            ),
          ),
    );

  }
}
