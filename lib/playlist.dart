import 'package:FLUTTER_MUSIC/music_model.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final image;
  final text;

  List<MusicModel> list;

  DetailedScreen(this.image, this.text, this.list);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  List<MusicModel> list;
  void initState() {
    list = MusicModel.list;
    //var x = [MusicMode2.list1, MusicModel.list];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: <Color>[
              Colors.blue,
              Colors.blueAccent.withOpacity(.8),
              Colors.black,
            ])),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[index].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  list[index].album,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.white60,
                                ),
                                iconSize: 45,
                                color: Colors.white,
                                onPressed: () {})
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
