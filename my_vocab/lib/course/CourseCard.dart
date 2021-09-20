//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/course/Course.dart';
import 'package:my_vocab/lesson/Lesson.dart';
import 'package:my_vocab/lesson/LessonPage.dart';
import 'package:my_vocab/vocab/ExercisePage.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: courseMain(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LessonPage(course.course_name, course.course_id);
            },
          )
        );
      },
    );
  }

  Widget courseMain(){
    return Container(
        height: 80,
        child: Card(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child:
                    Text(this.course.course_name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green)),
                  )
              )
            ],
          ),
        )
    );
  }
}