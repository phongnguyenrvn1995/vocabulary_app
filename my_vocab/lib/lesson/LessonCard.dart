//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/lesson/Lesson.dart';
import 'package:my_vocab/vocab/ExercisePage.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({Key key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: lessonMain(),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return ExercisePage(
                    title: this.lesson.lesson_name,
                    lessonID: this.lesson.lesson_id,
                  );
                },
            )
        );
      },
    );
  }

  Widget lessonMain(){
    return Container(
        height: 80,
        child: Card(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child:
                    Text(this.lesson.lesson_name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green)),
                  )
              )
            ],
          ),
        )
    );
  }
}