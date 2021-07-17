// @dart=2.9

import 'package:flutter/material.dart';
import 'package:my_vocab/lesson/Lesson.dart';
import 'package:my_vocab/lesson/LessonCard.dart';
import 'package:my_vocab/lesson/LessonListLoader.dart';
import 'package:my_vocab/lesson/LessonPage.dart';
import 'package:my_vocab/vocab/Vocab.dart';

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
      home: LessonPage(title: 'OK',),
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
    Lesson lessons = Lesson(1, "Nature 1", "nature1.json");
    return Scaffold(
      body: Center(
        child: LessonListLoader()
      ),
    );
  }
}
