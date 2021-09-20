// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/vocab/Vocab.dart';

import 'VocabListLoader.dart';

class ExercisePage extends StatelessWidget {
  String title = '';
  int lessonID;
  List<Vocab> vocabs = [];


  ExercisePage({this.lessonID, this.title});

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
        )
    );
  }
}