// @dart=2.9

import 'package:flutter/material.dart';
import 'package:my_vocab/course/Course.dart';
import 'package:my_vocab/course/CourseCard.dart';
import 'package:my_vocab/course/CoursePage.dart';
import 'package:my_vocab/vocab/Vocab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor kToDark = const MaterialColor(
    0xffc0f5f3, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffc0f5f3),//10%
      100: const Color(0xffc0f5f3),//20%
      200: const Color(0xffc0f5f3),//30%
      300: const Color(0xffc0f5f3),//40%
      400: const Color(0xffc0f5f3),//50%
      500: const Color(0xffc0f5f3),//60%
      600: const Color(0xffc0f5f3),//70%
      700: const Color(0xffc0f5f3),//80%
      800: const Color(0xffc0f5f3),//90%
      900: const Color(0xffc0f5f3),//100%
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Windy Vocabulary',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CoursePage()
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
    Course course = Course.fromJson({"course_id":18,"course_name":"Hack Brain Plus","course_description":"Collection of further words each unit","course_date_creat":"2021/09/16 12:53:25","course_status":1});
    print(course.course_name);
    return Scaffold(
      body: Center(
        child: CourseCard(course: course,)
      ),
    );
  }
}
