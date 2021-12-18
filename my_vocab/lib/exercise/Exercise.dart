// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_vocab/exercise/ExerciseLoader.dart';

class Exercise extends StatelessWidget{
  final int lessonID;
  final String lessonName;

  const Exercise({Key key, this.lessonID, this.lessonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('back');
        bool isSure = await showDialog<bool>(context: context, builder: (innerContext) {
          return AlertDialog(
            title: Text("Warning"),
            content: Text("You want to discard this exercise?"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context, true);
              }, child: Text('OK')),
              TextButton(onPressed: () {
                Navigator.pop(context, false);
              }, child: Text('Cancel'))
            ],
          );
        },);
        print("---here----" + isSure.toString());
        if(isSure)
          Navigator.pop(context);
        return false;
      },
      child:  Scaffold(
          appBar: AppBar(
            title: Text(lessonName),
          ),
          body: ExerciseLoader(lessonID: lessonID)
      ),
    );
  }
}