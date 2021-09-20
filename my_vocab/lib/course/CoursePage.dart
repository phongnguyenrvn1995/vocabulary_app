// @dart=2.9
import 'package:flutter/material.dart';
import 'package:my_vocab/course/CourseListLoader.dart';

class CoursePage extends StatelessWidget{
  final String title;
  CoursePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Course'),
      ),
      body: Center(
        child: CourseListLoader(),
      )
    );
  }
}