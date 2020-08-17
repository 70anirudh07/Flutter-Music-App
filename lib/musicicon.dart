import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
//import 'package:FLUTTER_MUSIC/playlist1.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Music extends StatefulWidget {
  final text;
  Music(this.text);
  @override
  _MusicState createState() => _MusicState();
}

AnimationController _animationIconController1;

AudioCache audioCache;

AudioPlayer _audioPlayer = AudioPlayer();

Duration duration = new Duration();
Duration position = new Duration();

bool issongplaying = false;

bool isplaying = false;

void seekToSeconds(int second) {
  Duration newDuration = Duration(seconds: second);
  _audioPlayer.seek(newDuration);
}

class _MusicState extends State<Music> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    initPlayer();
  }

  void initPlayer() {
    _animationIconController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );
    _audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: _audioPlayer);
    _audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });
    _audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });
  }

  Widget build(BuildContext context) {
    var audioCache = AudioCache(fixedPlayer: _audioPlayer);
    String path = "";
    Play() {
      audioCache.play(path);
    }

    return Scaffold(
      appBar: AppBar(
        title: widget.text,
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                Colors.blue,
                Colors.blueAccent.withOpacity(.8),
                Colors.black,
              ])),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              //alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/ps.jpg'), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(23)),
                ),
                SizedBox(
                  height: 40,
                ),
                Slider(
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      seekToSeconds(value.toInt());
                      value = value;
                    });
                  },
                ),
                Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.004,
                        left: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey.shade200,
                          Colors.grey,
                        ]),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(43)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.playlist_add, color: Colors.black),
                          ),
                          SizedBox(
                            width: 23,
                          ),
                          IconButton(
                            onPressed: () {
                              _audioPlayer.pause();
                            },
                            icon: Icon(Icons.pause, color: Colors.black),
                          ),
                          FloatingActionButton(
                            child: Icon(Icons.play_arrow),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              path = "dash.wav";
                              Play();
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              _audioPlayer.stop();
                            },
                            icon: Icon(Icons.stop),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.file_download, color: Colors.black),
                          ),
                        ]))
              ],
            ),
          ),
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () async {
          String filePath = await FilePicker.getFilePath();

          int status = await _audioPlayer.play(filePath, isLocal: true);

          if (status == 1) {
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),*/
      //backgroundColor: Colors.amber,
    );
  }
}
