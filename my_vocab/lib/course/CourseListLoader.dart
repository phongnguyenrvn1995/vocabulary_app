// @dart=2.9

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_vocab/course/Course.dart';
import 'package:my_vocab/course/CourseCard.dart';

import '../APIUtils.dart';

class CourseListLoader extends StatefulWidget {
  @override
  CourseListLoaderState createState() {
    return CourseListLoaderState();
  }
}

class CourseListLoaderState extends State<CourseListLoader> {
  @override
  Widget build(BuildContext context) {
    print('---------CourseListLoaderState--------');

    return RefreshIndicator(
      onRefresh: refresh,
      child:
          FutureBuilder<List<Course>>(
            future: fetch(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                Fluttertoast.showToast(msg: 'Request Error!!!');
                return ListView(children: [],);
              } else if(snapshot.hasData){
                return normalList(snapshot.data);
              }
              return CircularProgressIndicator();
            },
          ),
    );
  }

  Future<String> refresh () async {
    setState(() {

    });
    return '';
  }

  Future<List<Course>> fetch() async{
    String js = await APIUtil.getCourses();
    // print("data = " + js);
    return parse(js);
  }

  List<Course> parse(String js) {
    try {
      dynamic parsed = json.decode(js).cast<Map<String, dynamic>>();
      List courses = parsed.map<Course>((course) {
        print(course);
        return Course.fromJson(course);
      }).toList();
      return courses;
    } catch (ex) {
      print(ex);
    }
    return [];
  }

  ListView normalList(List<Course> course) {
    print('---normalList(List<Course> course) ---');
    return ListView.builder(
      itemCount: course.length,
      itemBuilder: (context, index) {
        print(course[index].course_name);
        return CourseCard(course: course[index]);
      },
    );
  }
}