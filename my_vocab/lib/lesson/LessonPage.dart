// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LessonListLoader.dart';
//ignore: must_be_immutable
class LessonPage extends StatelessWidget {
  final String title;
  int courseID;

  LessonPage(this.title, this.courseID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: LessonListLoader(courseID)
      ),
    );
  }
}