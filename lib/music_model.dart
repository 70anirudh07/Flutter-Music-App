import 'package:flutter/services.dart';

class MusicModel {
  final int id;
  final int rank;
  final String title;
  final String album;
  final double duration;

  MusicModel({this.id, this.title, this.rank, this.album, this.duration});

  static List<MusicModel> list = [
    MusicModel(
      id: 1,
      rank: 1,
      title: "Jealous",
      album: "[E]Nick Jonas",
      duration: 60,
    ),
    MusicModel(
      id: 2,
      rank: 2,
      title: "Close",
      album: "Complicated",
      duration: 60,
    ),
    MusicModel(
      id: 3,
      rank: 3,
      title: "Anywhere",
      album: "[E]Nick Jonas",
      duration: 60,
    ),
    MusicModel(
      id: 4,
      rank: 4,
      title: "Levels",
      album: "remix,Complicated",
      duration: 60,
    ),
    MusicModel(
      id: 5,
      title: "Say It",
      album: "Flume - Tove Lo",
      duration: 60,
    ),
    MusicModel(
      id: 6,
      title: "Vodoo",
      album: "Last Year Was Complicated",
      duration: 60,
    ),
    MusicModel(
      id: 7,
      title: "Touch",
      album: "Last Year Was Complicated",
      duration: 60,
    ),
    MusicModel(
      id: 8,
      title: "Take Over",
      album: "[E] Nick Jonas",
      duration: 60,
    ),
    MusicModel(
      id: 9,
      title: "Wilderness",
      album: "[E] Nick Jonas",
      duration: 60,
    )
  ];
}

class MusicMode2 {
  final int id;
  final String title;
  final String album;
  final double duration;

  MusicMode2({this.id, this.title, this.album, this.duration});

  static List<MusicMode2> list1 = [
    MusicMode2(
      id: 1,
      title: "Seuco the Child",
      album: "Fast",
      duration: 60,
    ),
    MusicMode2(
      id: 2,
      title: "Chain Smoker",
      album: "Josh Logan",
      duration: 60,
    ),
  ];
}
