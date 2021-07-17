// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LessonListLoader.dart';

class LessonPage extends StatelessWidget {
  LessonPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LessonListLoader()
      ),
    );
  }
}