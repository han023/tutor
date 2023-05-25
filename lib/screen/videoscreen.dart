import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../tools/applayout.dart';
import '../tools/appstate.dart';


class videoscreen extends StatelessWidget {
  videoscreen({Key? key,required this.id,required this.des}) : super(key: key);
  String id,des;

  @override
  Widget build(BuildContext context) {
    double width = AppLayout.getwidth(context);
    double height = AppLayout.getheight(context);
    AppState provider = Provider.of<AppState>(context);

    provider.controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        hideControls: false,
        mute: false,
        loop: true,showLiveFullscreenButton: false
      ),
    );

    return YoutubePlayerBuilder(
                onExitFullScreen: () {
                  SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  controller: provider.controller,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                    PlaybackSpeedButton(),
                  ],

                ), builder: (BuildContext , Widget ) {
                  return Scaffold(
                    body: Container(
                      height: height,
                      width: width,
                      color: Colors.black,

                        child: Column(
                          children: [
                            Widget,
                            Text(des,style: GoogleFonts.sigmarOne(fontSize: 30,color: Colors.white),),

                          ],
                        ),


                    ),
                  );
              },

    );
  }

}
