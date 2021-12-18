// @dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_vocab/exercise/QuestionBoardEV.dart';
import 'package:my_vocab/vocab/Vocab.dart';

import '../APIUtils.dart';
import 'QuestionBoardListen.dart';
import 'QuestionBoardOnSelectedListener.dart';
import 'QuestionBoardVE.dart';

class ExerciseLoader extends StatelessWidget{
  final int lessonID;
  BuildContext context;
  ExerciseLoader({Key key, this.lessonID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return FutureBuilder<List<Vocab>>(
      future: fetch(),
      builder: (context, snapshot) {
        if(snapshot.hasError){ // error
          Fluttertoast.showToast(
            msg: 'Request Error!!!',
          );
          return ListView(
            children: [
              Center(
              )
            ],
          );
        } else if(snapshot.hasData) { // success
          print(snapshot.data.length);
          return ExerciseLoaderStateFul(snapshot.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<List<Vocab>> fetch() async{
    String js = await APIUtil.getVocabsJson(lessonID);
    List<Vocab> vocabs = parse(js);
    print(vocabs);
    return vocabs;
  }

  List<Vocab> parse(String js) {
    try {
      final parsed = json.decode(js).cast<Map<String, dynamic>>();
      List vocabs =  parsed.map((vocab) {
        print(vocab);
        return Vocab.fromJson(vocab);
      }).toList();
      print('done');
      return vocabs.cast();
    } catch(ex) {
      print('Error ' + ex.toString());
    }
    return [];
  }
}

//ignore: must_be_immutable
class ExerciseLoaderStateFul extends StatefulWidget{
  List<Vocab> vocabs;

  ExerciseLoaderStateFul(List<Vocab> vocabs) {
    this.vocabs = vocabs;
    // print('ExerciseLoaderStateFul');
    // for(Vocab v in this.vocabs)
    //   print(v.vocab_en);
    this.vocabs.shuffle();
    // print('ExerciseLoaderStateFul shuffle');
    // for(Vocab v in this.vocabs)
    //   print(v.vocab_en);
  }

  @override
  State<ExerciseLoaderStateFul> createState() {
    print('createState');
    return ExerciseLoaderState(vocabs: vocabs);
  }
}

class ExerciseLoaderState extends State<ExerciseLoaderStateFul> {
  final List<Vocab> vocabs;
  int turnID = 0;
  static const int TYPE_EV = 0;
  static const int TYPE_VE = 1;
  static const int TYPE_LISTEN = 2;
  int exerciseType = 0; // 0 -> EV, 1 VE (write), 2 listen
  bool isDone = false;
  List<Vocab> sessionVocabs = [];
  ExerciseLoaderState({Key key, this.vocabs});

  @override
  Widget build(BuildContext context) {
    prepareSession();
    SelectedListener listener = SelectedListener((bool isCorrect) {
      if(isCorrect) {
        nextQuestion();
      }
    }) ;

    Widget board;
    Widget button = TextButton(
      child: Text('Exit Exercise'),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.red,
        onSurface: Colors.grey,
      ),
      onPressed: () => exitPress(),
    );


    print("exerciseType = " + exerciseType.toString());
    switch(exerciseType) {
      case TYPE_EV:
        board = QuestionBoardEV (
          sessionVocabs: sessionVocabs,
          goal: vocabs[turnID],
          listener: listener,
        );
        print("exerciseType = TYPE_EV");
        break;
      case TYPE_VE:
        board = QuestionBoardVE (
          sessionVocabs: sessionVocabs,
          goal: vocabs[turnID],
          listener: listener,
        );
        print("exerciseType = TYPE_VE");
        break;
      case TYPE_LISTEN:
        board = QuestionBoardListen (
          sessionVocabs: sessionVocabs,
          goal: vocabs[turnID],
          listener: listener,
        );
        print("exerciseType = TYPE_LISTEN");
        break;
      default:
        board = Center(
          child: Image.asset('assets/images/done.png'),
        );
        button = TextButton(
              child: Text('Done'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                print('Pressed');
                Navigator.pop(context);
              },
            );
    }

    return Stack(
      children: <Widget>[
        board,
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: button
          ),
        ),
      ],
    );
  }

  void exitPress() async{
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
  }

  void nextQuestion() {
    setState(() {
      if(isDone)
        return;
      turnID++;
      if(turnID == vocabs.length) {
        turnID = 0;
        exerciseType++;
        vocabs.shuffle();
        print('ExerciseLoaderState switch type');
        if(exerciseType > 2) {
          isDone = true;
          print('ExerciseLoaderState done');
        }
      }
    });
  }

  void prepareSession() {
    Vocab goal = vocabs[turnID];
    sessionVocabs.clear();
    sessionVocabs.add(goal);

    List<Vocab> temp = [];
    temp.addAll(vocabs);
    temp.remove(goal);
    temp.shuffle();

    sessionVocabs.add(temp.first);
    sessionVocabs.add(temp.last);
    sessionVocabs.shuffle();

    print('---------------------------');
    print('ExerciseLoaderState goal: ' + goal.vocab_en);
    for(Vocab v in sessionVocabs)
      print('ExerciseLoaderState: ' + v.vocab_en);
    print('---------------------------');
  }
}

class SelectedListener extends QuestionBoardOnSelectedListener {

  @override
  void onSelected(bool isCorrect) {
    _doOnSelected(isCorrect);
  }

  Function(bool isCorrect) _doOnSelected;

  SelectedListener(this._doOnSelected);
}