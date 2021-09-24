//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_vocab/APIUtils.dart';
import 'package:my_vocab/lesson/Lesson.dart';
import 'package:my_vocab/lesson/LessonCard.dart';
//ignore: must_be_immutable
class LessonListLoader extends StatefulWidget {
  int courseID;

  LessonListLoader(this.courseID);

  @override
  LessonListLoaderState createState() {
    return LessonListLoaderState(courseID);
  }
}

class LessonListLoaderState extends State<LessonListLoader> {
  int courseID;

  LessonListLoaderState(this.courseID);

  @override
  Widget build(BuildContext context) {
    print('---------LessonListLoaderState--------');
    return RefreshIndicator(
      child: FutureBuilder<List<Lesson>>(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(
              msg: 'Request Error!!!',
            );
            return ListView(
              children: [],
            );
          } else if (snapshot.hasData) {
            return normalList(snapshot.data);
          }
          return CircularProgressIndicator();
        },
      ),
      onRefresh: () {
        return refresh();
      },
    );
  }

  Future<String> refresh () async {
    setState(() {

    });
    return '';
  }

  ListView normalList(List<Lesson> lessons) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return LessonCard(
          lesson: lessons[index],
        );
      },
    );
  }

  Future<List<Lesson>> fetch() async {
    String js = await APIUtil.getLessons(courseID);
    return parse(js);
  }

  List<Lesson> parse(String js) {
    //print(js);
    try {
      dynamic parsed = json.decode(js).cast<Map<String, dynamic>>();
      List lessons = parsed.map<Lesson>((lesson) {
        print(lesson);
        return Lesson.fromJson(lesson);
      }).toList();
      return lessons.cast();
    } catch (ex) {
      print(ex);
    }
    return [];
  }
}
