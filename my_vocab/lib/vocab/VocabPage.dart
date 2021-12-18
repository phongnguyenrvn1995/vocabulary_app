// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/exercise/Exercise.dart';
import 'package:my_vocab/vocab/Vocab.dart';

import 'VocabListLoader.dart';

//ignore: must_be_immutable
class VocabPage extends StatelessWidget {
  String title = '';
  int lessonID;
  List<Vocab> vocabs = [];


  VocabPage({this.lessonID, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title),),
        body:Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Center(child: VocabListLoader(lessonID: lessonID,)),
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                  return Exercise(lessonID: lessonID, lessonName: title);
                },
              )
          );
        },
        child: Image.asset('assets/images/review.png'),
        backgroundColor: Colors.green,
      ),
    );
  }
}