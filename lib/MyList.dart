import 'package:flutter/material.dart';
import 'package:FLUTTER_MUSIC/playlist.dart';
import 'package:FLUTTER_MUSIC/music_model.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MyListView(
            img_location: "images/sing4.jpg",
            img_caption: 'Drake',
          ),
          SizedBox(
            width: 23,
          ),
          MyListView(
            img_location: "images/sing2.jpg",
            img_caption: 'Travis Scott',
          ),
          SizedBox(
            width: 23,
          ),
          MyListView(
            img_location: "images/pic2.jpg",
            img_caption: 'Marshmello',
          ),
          SizedBox(
            width: 23,
          ),
          MyListView(
            img_location: "images/sing1.jpg",
            img_caption: 'Shreya Ghoshal',
          ),
          SizedBox(
            width: 23,
          ),
          MyListView(
            img_location: "images/sing3.jpg",
            img_caption: 'Nick Jonas',
          ),
          SizedBox(
            width: 23,
          ),
          MyListView(
            img_location: "images/sing5.jpg",
            img_caption: 'Arijith Singh',
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final String img_location;
  final String img_caption;
  final x;
  MyListView({this.img_location, this.img_caption, this.x});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailedScreen(img_location, img_caption, x)));
        },
        child: ListTile(
          title: Container(
            height: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(img_location), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(60)),
          ),
          subtitle: Container(
            //alignment: Alignment.topCenter,
            child: Text(
              img_caption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
