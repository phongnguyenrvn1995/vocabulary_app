// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/Vocab.dart';
import 'package:my_vocab/VocabAnimContainFul.dart';
import 'package:my_vocab/VocabCard.dart';
import 'package:my_vocab/VocabListLoader.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            child: Center(
              child: VocabListLoader(),
            ),
          )
        ],

        )
      );
  }
}
