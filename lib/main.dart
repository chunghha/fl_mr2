import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:supercharged/supercharged.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: '#5182ac'.toColor(),
    ),
  );
  runApp(
    Mr2App(),
  );
}

class Mr2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      home: Mr2Page(),
    );
  }
}

class Mr2Page extends StatefulWidget {
  Mr2Page({this.title = 'Mr.2'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _Mr2PageState();
  }
}

class _Mr2PageState extends State<Mr2Page> {
  List<YoutubePlayerController> _controllers;
  List<String> _playList = ['-18TlgAxk-Y', 'b-MxuGQtNyY', 'er1RYWQf0Gc'];
  List<String> _outlineList = ['#a3be8c', '#8bc0d0', '#d08770'];

  final _youtubePlayerFlags = YoutubePlayerFlags(
    autoPlay: false,
    hideThumbnail: false,
    isLive: false,
  );

  @override
  void initState() {
    _controllers = _playList
        .map((videoId) => YoutubePlayerController(
              initialVideoId: videoId,
              flags: _youtubePlayerFlags,
            ))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 16.0,
          title: Text('Mr.2 - White Winter',
              style: TextStyle(color: '#eceff4'.toColor())),
          backgroundColor: '#2e3440'.toColor(),
        ),
        backgroundColor: '#2e3440'.toColor(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _raisedButton(0, _outlineList[0]),
                            _sizedBox(4.0),
                            _raisedButton(1, _outlineList[1]),
                            _sizedBox(4.0),
                            _raisedButton(2, _outlineList[2]),
                          ])))
            ]));
  }

  SizedBox _sizedBox(double height) {
    return SizedBox(height: height);
  }

  RaisedButton _raisedButton(int index, String value) {
    return RaisedButton(
      color: value.toColor().withOpacity(0.2),
      elevation: 8.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      child: Center(
          child: _youtubePlayer((index).toString(), _controllers[index])),
      onPressed: () {},
    );
  }

  YoutubePlayer _youtubePlayer(String key, YoutubePlayerController controller) {
    return YoutubePlayer(
        key: Key(key),
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: '#ebcb8b'.toColor(),
        onReady: () {
          print('Player is ready: $key.');
        });
  }
}
