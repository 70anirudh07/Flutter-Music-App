import 'package:FLUTTER_MUSIC/music_model.dart';
import 'package:FLUTTER_MUSIC/playlist.dart';
import 'package:FLUTTER_MUSIC/playlist1.dart';
import 'package:FLUTTER_MUSIC/videofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:FLUTTER_MUSIC/MyList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

ThemeData _lighttheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);
ThemeData _darktheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.black);
bool _switch = false;

class FirstDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blueGrey.shade200);
    return MaterialApp(
      routes: {'/video': (_) => VideoFile()},
      theme: _switch ? _darktheme : _lighttheme,
      home: Builder(
        builder: (context) => Scaffold(
          //backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                  Colors.blue,
                  Colors.blueAccent.withOpacity(.8),
                  Colors.black,
                ])
                /*image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/back.jpg'),
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(1), BlendMode.softLight),
            )*/
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Container(
                  child: ListView(children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: new Border.all(),
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey.shade100,
                          Colors.grey,
                        ]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 8.0,
                            height: 8,
                          ),
                          Icon(
                            Icons.search,
                            // color: Colors.white,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              focusNode: FirstDisabledFocusNode(),
                              enabled: true,
                              //: false,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Search..',
                                hintStyle: TextStyle(
                                    /*color: Colors.white,*/ fontSize: 23),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.mic,
                          ),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Text(' Top Charts',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(children: <Widget>[
                      ChartImages1(
                          'images/bg1.jpg', 'Hip Hop', MusicMode2.list1),
                      SizedBox(
                        width: 16.0,
                      ),
                      ChartImages1('images/bg4.jpg', 'Jazz', MusicMode2.list1),
                      SizedBox(
                        width: 16.0,
                      ),
                      //SingerImages('images/sing1.jpg'),
                    ]),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(children: <Widget>[
                      ChartImages(
                          'images/bg6.jpg', "Trending", MusicModel.list),
                      SizedBox(
                        width: 16.0,
                      ),
                      ChartImages('images/bg5.jpg', "Top 50", MusicModel.list),
                      SizedBox(
                        width: 16.0,
                      ),
                      //SingerImages('images/sing1.jpg'),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(' Artist',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    MyList(),
                  ]),
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue.withOpacity(.2),
              child: new ListView(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                children: <Widget>[
                  new Container(
                    child: new DrawerHeader(
                        child: new CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage:
                            AssetImage('images/flutterpicicon2.jpg'),
                      ),
                    )),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: GradientColors.darkOcean),
                    ),
                  ),
                  new Container(
                      decoration: BoxDecoration(
                        border: new Border.all(),
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blue.withOpacity(.4)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      //color: Colors.blue.shade50,
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          new Text(
                            'My Library',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  new ListTile(
                    title: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.personal_video,
                            size: 30,
                          ),
                          //color: Colors.amber,
                          onPressed: () {},
                        ),
                        Text(
                          '  Videos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/video');
                    },
                  ),
                  new SwitchListTile(
                      title: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      secondary: IconButton(
                        icon: Icon(
                          Icons.star,
                          size: 25,
                          //color: Colors.black,
                        ),
                        onPressed: null,
                      ),
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                        });
                      })
                ],
              ),
            ),
          ),
          appBar: AppBar(
            //backgroundColor: Colors.transparent,
            shadowColor: Colors.red,
            brightness: Brightness.light,
            /*flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.black, Colors.blueAccent])),
            ),*/
            title: Text("FMUSIC"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
          ),
          //backgroundColor: Colors.blue.shade50,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChartImages extends StatelessWidget {
  final image;
  final text;
  final x;
  //final y;
  Function function;
  ChartImages(this.image, this.text, this.x);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedScreen(image, text, x)));
        },
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4.0,
                      offset: Offset(1.0, 6.0),
                    )
                  ]),
              height: 120.0,
              //width: 150.0,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      image,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),
                    bottom: 10.0,
                    left: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartImages1 extends StatelessWidget {
  final image;
  final text;
  final x;
  //final y;
  Function function;
  ChartImages1(this.image, this.text, this.x);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedScreen1(image, text, x)));
        },
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4.0,
                      offset: Offset(1.0, 6.0),
                    )
                  ]),
              height: 120.0,
              //width: 150.0,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      image,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),
                    bottom: 10.0,
                    left: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void click1() {
  print('click1');
}

void click2() {
  print('click2');
}

void click3() {
  print('click3');
}

void click4() {
  print('click4');
}
