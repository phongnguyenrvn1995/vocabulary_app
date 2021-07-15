// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/Vocab.dart';
import 'package:my_vocab/VocabAnimContainFul.dart';
import 'package:my_vocab/VocabCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _4Test(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}


class _4Test extends StatelessWidget {
  _4Test({Key key, this.title}) : super(key: key);
  final String title;
  List<Vocab> vocabs = [];

  @override
  Widget build(BuildContext context) {
    vocabs.clear();
    vocabs.add(Vocab.fromJson({'id': 1, 'lesson': 1, 'type': 4, 'en': "SandStorm", 'ipa': "/ˈsænd.stɔːm/", 'vi': "Bão cát", 'description': "a strong wind in a desert carrying a large amount of sand", 'urlPronunciation': "http://192.168.0.8:8000/uksands003.mp3"}));
    vocabs.add(Vocab.fromJson({'id': 1, 'lesson': 1, 'type': 4, 'en': "SandStorm", 'ipa': "/ˈsænd.stɔːm/", 'vi': "Bão cát", 'description': "a strong wind in a desert carrying a large amount of sand", 'urlPronunciation': "http://192.168.0.8:8000/uksands003.mp3"}));
    vocabs.add(Vocab.fromJson({'id': 1, 'lesson': 1, 'type': 4, 'en': "SandStorm", 'ipa': "/ˈsænd.stɔːm/", 'vi': "Bão cát", 'description': "a strong wind in a desert carrying a large amount of sand", 'urlPronunciation': "http://192.168.0.8:8000/uksands003.mp3"}));
    vocabs.add(Vocab.fromJson({'id': 1, 'lesson': 1, 'type': 4, 'en': "SandStorm", 'ipa': "/ˈsænd.stɔːm/", 'vi': "Bão cát", 'description': "a strong wind in a desert carrying a large amount of sand", 'urlPronunciation': "http://192.168.0.8:8000/uksands003.mp3"}));
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center(
        child: ListView.builder(
          itemCount: vocabs.length,
          itemBuilder: (context, index) {
            return VocabAnimContainFul(vocab: vocabs[index],);
          },
        ),
      )
    );
  }
}
