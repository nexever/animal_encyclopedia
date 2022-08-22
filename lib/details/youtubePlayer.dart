import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

import '../layout/widgets.dart';


class MyYoutubePlayer extends StatefulWidget {
  // const youtubePlayer({Key? key}) : super(key: key);
  MyYoutubePlayer({this.title,this.url});
  final String title;
  final url;
  @override
  State<MyYoutubePlayer> createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  YoutubePlayerController _controller;

  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: true,
          mute: false,
        )
    );
  }



 @override void initState(){
    runYoutubePlayer();
    super.initState();
  }

  @override void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
       builder:(context,player){
        return Scaffold(
          appBar: new ReusableWidgets().getAppBar(context,'',true),
          body: Container(
            padding: EdgeInsets.all(0),
            height: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                player,
                SizedBox(height: 10,),
                textHeading1(context, widget.title),
                SizedBox(height: 10,),

              ],
            ),
          ),
        );
       },
    );
  }
}
